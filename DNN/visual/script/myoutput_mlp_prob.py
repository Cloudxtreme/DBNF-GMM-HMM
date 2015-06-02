#! /usr/bin/python
# -*- coding: UTF-8 -*-

import sys

import numpy
import theano
import theano.tensor as T
from struct import *
import string

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

# 出力層クラス
class OutputLayer(object):

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
        return T.dot(x,self.W)+self.Bias


# シャッフリング関数

def shuffle_unison(dat, lab):
    
    rng_state = numpy.random.get_state()
    numpy.random.shuffle(dat)

    numpy.random.set_state(rng_state)
    numpy.random.shuffle(lab)

    return

# メイン関数

if __name__ == "__main__":

    mlpdirname  =sys.argv[1]         # 推定された MLP の保存ディレクトリ名
    filelist    =sys.argv[2]         # 入力ファイルリスト
    indirname   =sys.argv[3]         # 入力先のディレクトリ名
    outdirname  =sys.argv[4]         # 出力先のディレクトリ名
    dim         =int(sys.argv[5])    # 特徴量次元*4
    
    # モデルパラメータの領域の確保と設定

    L1=SigmoidLayer(numpy.load(mlpdirname+"/L1.W.npy"),
                    numpy.load(mlpdirname+"/L1.B.npy"))
    L2=SigmoidLayer(numpy.load(mlpdirname+"/L2.W.npy"),
                    numpy.load(mlpdirname+"/L2.B.npy"))
    L3=SigmoidLayer(numpy.load(mlpdirname+"/L3.W.npy"),
                    numpy.load(mlpdirname+"/L3.B.npy"))
    L4=SoftmaxLayer(numpy.load(mlpdirname+"/L4.W.npy"),
                   numpy.load(mlpdirname+"/L4.B.npy"))
                    

    # ニューラルネットワークの出力を計算する数式の作成
    x=T.fmatrix("x")
    p=L4.forward(L3.forward(L2.forward(L1.forward(x))))
    mlp_output=theano.function(inputs=[x],outputs=p)
  
    for line in open(filelist, 'r').readlines() :
        print string.strip(line)
        line=string.strip(line)

        # 入力データ・出力ファイルの読み込み
        data=numpy.fromfile(indirname+'/'+line+'.pca330_norm',dtype=">f4")
        data=data.reshape(len(data)/L1.inum,L1.inum)
        f=open(outdirname+'/'+line+'.prob',"wb") # 出力ファイルの名前

       # HTK形式の特徴量とするためのヘッダー部分の書き込み
        f.write(pack('>L',len(data)))   # データの総数
        f.write(pack('>L',100000))      # シフト幅(ns/100)
        f.write(pack('>H',dim))         # 特徴量次元*byte数(floatなら4byte)
        f.write(pack('>H',9))           # 特徴量の種類(オリジナルは9): HTKbooks参照

        out=mlp_output(data)
        out.byteswap(True)
        out.tofile(f)
     
        f.close()
