#! /usr/bin/python
# -*- coding: UTF-8 -*-


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
def shuffle(dat, lab):
    state=numpy.random.get_state()
    numpy.random.shuffle(dat)
    numpy.random.set_state(state)
    numpy.random.shuffle(lab)
    return

# メイン関数
if __name__ == "__main__":

    train_datfilename=sys.argv[1]         # 学習データ
    train_labfilename=sys.argv[2]         # 学習ラベル

    valid_datfilename=sys.argv[3]         # 開発データ
    valid_labfilename=sys.argv[4]         # 開発ラベル

    rbmdirname       =sys.argv[5]         # RBM の保存ディレクトリ名
    mlpdirname       =sys.argv[6]         # 推定された MLP の保存ディレクトリ名

    seed             =int(sys.argv[7])    # 乱数種
    epoch            =int(sys.argv[8])    # エポック数
    mbsize           =int(sys.argv[9])    # ミニバッチサイズ


    learning_rate    =float(sys.argv[10]) # 学習係数
    momentum         =float(sys.argv[11]) # 慣性項
    regularization   =float(sys.argv[12]) # 正則化係数

    # モデルパラメータの領域の確保と設定
    L1=SigmoidLayer(numpy.load(rbmdirname+"/L1/rbm.W.npy"),
                    numpy.load(rbmdirname+"/L1/rbm.HBias.npy"))
    L2=SigmoidLayer(numpy.load(rbmdirname+"/L2/rbm.W.npy"),
                    numpy.load(rbmdirname+"/L2/rbm.HBias.npy"))
    L3=SigmoidLayer(numpy.load(rbmdirname+"/L3/rbm.W.npy"),
                    numpy.load(rbmdirname+"/L3/rbm.HBias.npy"))
    L4=SoftmaxLayer(numpy.load(rbmdirname+"/L4/rbm.W.npy"),
                    numpy.load(rbmdirname+"/L4/rbm.HBias.npy"))


    # 開発データの読み込み
    valid_dat=numpy.fromfile(valid_datfilename,dtype=">f4")
    valid_dat=valid_dat.reshape(len(valid_dat)/L1.inum,L1.inum)
    valid_lab=numpy.fromfile(valid_labfilename,dtype=">H")

    # テストデータの読み込み
    #test_dat=numpy.fromfile("xdat/clean/mytest.xdat",dtype=">f4")
    #test_dat=test_dat.reshape(len(test_dat)/L1.inum,L1.inum)
    #test_lab=numpy.fromfile("ylab/mytest.ylab",dtype=">H")
    
    # ニューラルネットワークの出力を計算する数式の作成
    x=T.fmatrix("x")
    p=L4.forward(L3.forward(L2.forward(L1.forward(x))))

    # コストを計算する数式の作成
    y=T.ivector("y")
    cost=T.sum(T.nnet.categorical_crossentropy(p,y))


    # 勾配を計算する数式の作成
    grads=T.grad(cost,[L1.W,L1.Bias,L2.W,L2.Bias,L3.W,L3.Bias,L4.W,L4.Bias])

    # 学習用 Python 関数の生成
    lr=T.fscalar("lr")
    mm=T.fscalar("mm")
    re=T.fscalar("re")
    
    updates_diff=[
        (L1.DiffW   ,-lr*(grads[ 0]+re*L1.W   )+mm*L1.DiffW   ),
        (L1.DiffBias,-lr*(grads[ 1]+re*L1.Bias)+mm*L1.DiffBias),
        (L2.DiffW   ,-lr*(grads[ 2]+re*L2.W   )+mm*L2.DiffW   ),
        (L2.DiffBias,-lr*(grads[ 3]+re*L2.Bias)+mm*L2.DiffBias),
        (L3.DiffW   ,-lr*(grads[ 4]+re*L3.W   )+mm*L3.DiffW   ),
        (L3.DiffBias,-lr*(grads[ 5]+re*L3.Bias)+mm*L3.DiffBias),
        (L4.DiffW   ,-lr*(grads[ 6]+re*L4.W   )+mm*L4.DiffW   ),
        (L4.DiffBias,-lr*(grads[ 7]+re*L4.Bias)+mm*L4.DiffBias),]
    
    updates_update=[
        (L1.W   ,L1.W   +L1.DiffW   ),
        (L1.Bias,L1.Bias+L1.DiffBias),
        (L2.W   ,L2.W   +L2.DiffW   ),
        (L2.Bias,L2.Bias+L2.DiffBias),
        (L3.W   ,L3.W   +L3.DiffW   ),
        (L3.Bias,L3.Bias+L3.DiffBias),
        (L4.W   ,L4.W   +L4.DiffW   ),
        (L4.Bias,L4.Bias+L4.DiffBias),]
    
    trainer_diff  =theano.function(
        inputs=[x,y,lr,mm,re],outputs=cost,updates=updates_diff)

    trainer_update=theano.function(
        inputs=[]   ,outputs=None,updates=updates_update)

    # 評価用 Python 関数の生成
    err=T.sum(T.neq(T.argmax(p,axis=1),y))

    tester=theano.function(inputs=[x,y],outputs=err)

    # 開発データによる評価
    max_acc=(1.0-tester(valid_dat,valid_lab)/float(len(valid_lab)))*100.0
    print " 0-th epoch,               acc=%5.2f"%max_acc
    sys.stdout.flush()

    max_L1_W=L1.W.get_value()
    max_L1_B=L1.Bias.get_value()
    max_L2_W=L2.W.get_value()
    max_L2_B=L2.Bias.get_value()
    max_L3_W=L3.W.get_value()
    max_L3_B=L3.Bias.get_value()
    max_L4_W=L4.W.get_value()
    max_L4_B=L4.Bias.get_value()



    # パラメータの推定
    numpy.random.seed(seed)

    for e in range(epoch):
        allent=0.0
        for i in range(1,10):
               # 学習用入力データファイルの読み込み
             train_dat=numpy.fromfile(train_datfilename+".xdat",dtype=">f4")
             train_dat=train_dat.reshape(len(train_dat)/L1.inum,L1.inum)
             train_lab=numpy.fromfile(train_labfilename+".ylab",dtype=">H")
             
             mbnum=len(train_lab)/mbsize

               # 学習データのシャッフリング
             shuffle(train_dat,train_lab)

               # ミニバッチによるパラメータ推定
             ent=0.0
             for b in range(mbnum):
                 ent+=trainer_diff(train_dat[mbsize*b:mbsize*(b+1)],
                                   train_lab[mbsize*b:mbsize*(b+1)],
                                   learning_rate,
                                   momentum,
                                   regularization)
                 trainer_update()
             ent/=mbnum*mbsize
             allent+=ent 
        print "%2d-th epoch, ent=%5.2e,"%(e+1,allent/i),
        sys.stdout.flush()

        # 開発データの評価      
        tmp_acc=(1.0-tester(valid_dat,valid_lab)/float(len(valid_lab)))*100.0
        print "acc=%5.2f,"%tmp_acc,
        sys.stdout.flush()

        # 学習係数の制御
        print "lr=%5.2e,"%learning_rate,
 
        if tmp_acc < max_acc:
            print "rejected"
            learning_rate/=2.0
            L1.W.set_value(max_L1_W)
            L1.Bias.set_value(max_L1_B)
            L2.W.set_value(max_L2_W)
            L2.Bias.set_value(max_L2_B)
            L3.W.set_value(max_L3_W)
            L3.Bias.set_value(max_L3_B)
            L4.W.set_value(max_L4_W)
            L4.Bias.set_value(max_L4_B)

        else:
            print "accepted"
            max_acc=tmp_acc
            max_L1_W=L1.W.get_value()
            max_L1_B=L1.Bias.get_value()
            max_L2_W=L2.W.get_value()
            max_L2_B=L2.Bias.get_value()
            max_L3_W=L3.W.get_value()
            max_L3_B=L3.Bias.get_value()
            max_L4_W=L4.W.get_value()
            max_L4_B=L4.Bias.get_value()

            
        sys.stdout.flush()

    # ニューラルネットワーク定義ファイルの書き出し
    numpy.save(mlpdirname+"/L1.W.npy",max_L1_W)
    numpy.save(mlpdirname+"/L1.B.npy",max_L1_B)
    numpy.save(mlpdirname+"/L2.W.npy",max_L2_W)
    numpy.save(mlpdirname+"/L2.B.npy",max_L2_B)
    numpy.save(mlpdirname+"/L3.W.npy",max_L3_W)
    numpy.save(mlpdirname+"/L3.B.npy",max_L3_B)
    numpy.save(mlpdirname+"/L4.W.npy",max_L4_W)
    numpy.save(mlpdirname+"/L4.B.npy",max_L4_B)

