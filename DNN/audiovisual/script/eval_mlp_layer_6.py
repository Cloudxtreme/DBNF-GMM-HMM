#! /usr/bin/python
# -*- coding: euc-jp -*-
# Written by Shigeki Matsuda
# Copyright (C) 2013 NICT

import sys

import numpy
import theano
import theano.tensor as T

# シグモイド層クラス

class SigmoidLayer(object):

    # コンストラクタ関数
    def __init__(self,W,bias):

        self.inum=W.shape[0]
        self.nnum=W.shape[1]

        # モデルパラメータの領域の確保

        self.W   =theano.shared(value=W   ,name="W")
        self.Bias=theano.shared(value=bias,name="Bias")

        # 変化量の保存領域の確保

        self.DiffW   =theano.shared(
            value=numpy.zeros(self.inum*self.nnum,
                              dtype=theano.config.floatX).reshape(self.inum,
                                                                  self.nnum),
            name="DiffW")
        self.DiffBias=theano.shared(
            value=numpy.zeros(self.nnum,dtype=theano.config.floatX),
            name="DiffBias")
        
        return

    # 伝播関数
    def forward(self,x):
        return T.nnet.sigmoid(T.dot(x,self.W)+self.Bias)

# ソフトマックス層クラス

class SoftmaxLayer(object):

    # コンストラクタ関数
    def __init__(self,W,bias):

        self.inum=W.shape[0]
        self.nnum=W.shape[1]

        # モデルパラメータの領域の確保

        self.W   =theano.shared(value=W   ,name="W")
        self.Bias=theano.shared(value=bias,name="Bias")

        # 変化量の保存領域の確保

        self.DiffW   =theano.shared(
            value=numpy.zeros(self.inum*self.nnum,
                              dtype=theano.config.floatX).reshape(self.inum,
                                                                  self.nnum),
            name="DiffW")
        self.DiffBias=theano.shared(
            value=numpy.zeros(self.nnum,dtype=theano.config.floatX),
            name="DiffBias")

        return

    # 伝播関数
    def forward(self,x):
        return T.nnet.softmax(T.dot(x,self.W)+self.Bias)

# シャッフリング関数

def shuffle_unison(dat, lab):
    
    rng_state = numpy.random.get_state()
    numpy.random.shuffle(dat)

    numpy.random.set_state(rng_state)
    numpy.random.shuffle(lab)

    return

# メイン関数

if __name__ == "__main__":

    datfilename=sys.argv[1]         # 評価データ
    labfilename=sys.argv[2]         # 評価ラベル

    mlpdirname =sys.argv[3]         # 推定された MLP の保存ディレクトリ名

    # モデルパラメータの領域の確保と設定

    L1=SigmoidLayer(numpy.load(mlpdirname+"/L1.W.npy"),
                    numpy.load(mlpdirname+"/L1.B.npy"))
    L2=SigmoidLayer(numpy.load(mlpdirname+"/L2.W.npy"),
                    numpy.load(mlpdirname+"/L2.B.npy"))
    L3=SigmoidLayer(numpy.load(mlpdirname+"/L3.W.npy"),
                    numpy.load(mlpdirname+"/L3.B.npy"))
    L4=SigmoidLayer(numpy.load(mlpdirname+"/L4.W.npy"),
                    numpy.load(mlpdirname+"/L4.B.npy"))
    L5=SoftmaxLayer(numpy.load(mlpdirname+"/L5.W.npy"),
                    numpy.load(mlpdirname+"/L5.B.npy"))

                    
    # 評価データの読み込み

    test_dat=numpy.fromfile(datfilename,dtype=">f4")
    test_dat=test_dat.reshape(len(test_dat)/L1.inum,L1.inum)
    test_lab=numpy.fromfile(labfilename,dtype=">H")

    # ニューラルネットワークの出力を計算する数式の作成

    x=T.fmatrix("x")
    p=L5.forward(L4.forward(L3.forward(L2.forward(L1.forward(x)))))

    # 評価用 Python 関数の生成

    y=T.ivector("y")
    err=T.sum(T.neq(T.argmax(p,axis=1),y))

    tester=theano.function(inputs=[x,y],outputs=err)

    # 評価実験

    acc=(1.0-tester(test_dat,test_lab)/float(len(test_lab)))*100.0
    print "acc=%5.2f"%acc

