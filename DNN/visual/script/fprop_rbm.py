#! /usr/bin/python
# -*- coding: euc-jp -*-
# Written by Shigeki Matsuda
# Copyright (C) 2013 NICT

import sys

import numpy
import theano
import theano.tensor as T

# 推定条件の設定

datfilename=sys.argv[1]       # 入力データのファイル名
outfilename=sys.argv[2]       # 出力データのファイル名
rbmfilename=sys.argv[3]       # RBM 定義ファイル名

mbsize     =int(sys.argv[4])  # ミニバッチサイズ

# モデルパラメータの読み込みと領域の確保

W=theano.shared(
    value=numpy.load(rbmfilename+".W.npy"),
    name="W")

HBias=theano.shared(
    value=numpy.load(rbmfilename+".HBias.npy"),
    name="HBias")

VBias=theano.shared(
    value=numpy.load(rbmfilename+".VBias.npy"),
    name="VBias")

hidnum=len(HBias.get_value())
visnum=len(VBias.get_value())


# 伝播の数式の作成

v0act=T.fmatrix("v0act")
h0act=T.nnet.sigmoid(T.dot(v0act,W  )+HBias)

# 出力計算用 Python 関数の作成

propageter=theano.function(inputs=[v0act],outputs=h0act)

# 出力データの計算処理
for i in range(1,2):
     # 学習用入力データファイルの読み込み
    data=numpy.fromfile(datfilename+str(i)+".xdat",dtype=">f4")
    data=data.reshape(len(data)/visnum,visnum)

    mbnum=len(data)/mbsize

    f=open(outfilename+str(i)+".xdat","wb")

    for b in range(mbnum):
        out=propageter(data[mbsize*b:mbsize*(b+1)])
        out.byteswap(True)
        out.tofile(f)
    del data
    del out 
    f.close()
