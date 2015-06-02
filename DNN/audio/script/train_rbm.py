#! /usr/bin/python
# -*- coding: UTF-8 -*-

import sys
import time

import numpy
import theano
import theano.tensor as T

from theano.sandbox.rng_mrg import MRG_RandomStreams as RandomStreams

# 推定条件の設定
datfilename=sys.argv[1]          # 学習用入力データファイル名
rbmfilename=sys.argv[2]          # 推定された RBM 定義ファイル名

seed       =int(sys.argv[3])     # 乱数シード
hidnum     =int(sys.argv[4])     # 隠れ層のニューロン数
visnum     =int(sys.argv[5])     # 可視層のニューロン数
epoch      =int(sys.argv[6])     # エポック数
mbsize     =int(sys.argv[7])     # ミニバッチサイズ
lr         =float(sys.argv[8])   # 学習率
mm         =float(sys.argv[9])   # モーメンタム
re         =float(sys.argv[10])  # 重みコスト
if sys.argv[11]=="GB":
    gbrbm  =True
    bgrbm  =False                 # GB-RBM,BG-RBM,BB-RBM の選択
elif sys.argv[11]=="BG":
    gbrbm  =False
    bgrbm  =True
else:
    gbrbm  =False
    bgrbm  =False


# モデルパラメータの初期化と領域の確保
W=theano.shared(
    value=numpy.asarray(numpy.random.RandomState(seed).uniform(
    low =-4.0*numpy.sqrt(6.0/(hidnum+visnum)),
    high= 4.0*numpy.sqrt(6.0/(hidnum+visnum)),
    size=(visnum,hidnum)),dtype=theano.config.floatX),
    name="W")

HBias=theano.shared(
    value=numpy.zeros(hidnum,dtype=theano.config.floatX),
    name="HBias")

VBias=theano.shared(
    value=numpy.zeros(visnum,dtype=theano.config.floatX),
    name="VBias")

# 伝播の数式の作成
gibbs_rng=RandomStreams(
    numpy.random.RandomState(seed).randint(2**30))

v0act=T.fmatrix("v0act")

# 可視層から隠れ層のサンプリング(一回目)
if bgrbm==True:
    h0act=T.dot(v0act,W  )+HBias
    h0smp=gibbs_rng.normal(
        size=(mbsize,hidnum),std=1,avg=h0act,dtype=theano.config.floatX)
else:
    h0act=T.nnet.sigmoid(T.dot(v0act,W  )+HBias)
    h0smp=gibbs_rng.binomial(
        size=(mbsize,hidnum),n=1,p=h0act,dtype=theano.config.floatX)
# 隠れ層から可視層のサンプリング(一回目)
if gbrbm==True:
    v1act=T.dot(h0smp,W.T)+VBias
else:
    v1act=T.nnet.sigmoid(T.dot(h0smp,W.T)+VBias)

# 可視層から隠れ層のサンプリング(二回目)
if bgrbm==True:
    h1act=T.dot(v1act,W  )+HBias
else:
    h1act=T.nnet.sigmoid(T.dot(v1act,W  )+HBias)

# 更新の数式の作成
grad_W    =(T.dot(v1act.T,h1act)-T.dot(v0act.T,h0act))/mbsize
grad_HBias=(T.sum(h1act,axis=0) -T.sum(h0act,axis=0) )/mbsize
grad_VBias=(T.sum(v1act,axis=0) -T.sum(v0act,axis=0) )/mbsize

# 学習用 Python 関数の作成
DeltaW=theano.shared(
    value=numpy.zeros(visnum*hidnum,
                      dtype=theano.config.floatX).reshape(visnum,hidnum),
    name="DeltaW"    )

DeltaHBias=theano.shared(
    value=numpy.zeros(hidnum,dtype=theano.config.floatX),
    name="DeltaHBias")

DeltaVBias=theano.shared(
    value=numpy.zeros(visnum,dtype=theano.config.floatX),
    name="DeltaVBias")

updates_diff=[
    (DeltaW    ,-lr*grad_W    +mm*DeltaW    -re*W),
    (DeltaHBias,-lr*grad_HBias+mm*DeltaHBias     ),
    (DeltaVBias,-lr*grad_VBias+mm*DeltaVBias     )]

updates_update=[
    (W    ,W    +DeltaW    ),
    (HBias,HBias+DeltaHBias),
    (VBias,VBias+DeltaVBias)]

mse=T.mean((v0act-v1act)**2)

trainer_diff  =theano.function(inputs=[v0act],
                               outputs=mse,
                               updates=updates_diff)

trainer_update=theano.function(inputs=[],
                               outputs=None,
                               updates=updates_update)

# パラメータの推定処理
numpy.random.seed(seed)

for e in range(epoch):
    allerr=0.0
    t1=time.clock()
    for i in range(1,10):
          # 学習用入力データファイルの読み込み
         data=numpy.fromfile(datfilename+str(i)+".xdat",dtype=">f4")
         data=data.reshape(len(data)/visnum,visnum)

         mbnum=data.shape[0]/mbsize
          
          # 学習データのシャッフリング
         
         numpy.random.shuffle(data)

          # ミニバッチによる推定
         err=0.0
         for b in range(mbnum):
             err+=trainer_diff(data[mbsize*b:mbsize*(b+1)])
             trainer_update()
         err/=mbnum
         allerr+=err
         del data

    t2=time.clock()
    print "%2d-th epoch, %e mse, (%f sec)"%(e+1,allerr/i,t2-t1)
    sys.stdout.flush()
    
# モデルパラメータの書き出し
numpy.save(rbmfilename+".W.npy"    ,W.get_value()    )
numpy.save(rbmfilename+".HBias.npy",HBias.get_value())
numpy.save(rbmfilename+".VBias.npy",VBias.get_value())
