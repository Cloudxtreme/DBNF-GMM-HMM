#! /usr/bin/python
# -*- coding: euc-jp -*-
# Written by Shigeki Matsuda
# Copyright (C) 2013 NICT

import sys

import numpy
import theano
import theano.tensor as T

# �����⥤���إ��饹

class SigmoidLayer(object):

    # ���󥹥ȥ饯���ؿ�
    def __init__(self,W,bias):

        self.inum=W.shape[0]
        self.nnum=W.shape[1]

        # ��ǥ�ѥ�᡼�����ΰ�γ���

        self.W   =theano.shared(value=W   ,name="W")
        self.Bias=theano.shared(value=bias,name="Bias")

        # �Ѳ��̤���¸�ΰ�γ���

        self.DiffW   =theano.shared(
            value=numpy.zeros(self.inum*self.nnum,
                              dtype=theano.config.floatX).reshape(self.inum,
                                                                  self.nnum),
            name="DiffW")
        self.DiffBias=theano.shared(
            value=numpy.zeros(self.nnum,dtype=theano.config.floatX),
            name="DiffBias")
        
        return

    # ���Ŵؿ�
    def forward(self,x):
        return T.nnet.sigmoid(T.dot(x,self.W)+self.Bias)

# ���եȥޥå����إ��饹

class SoftmaxLayer(object):

    # ���󥹥ȥ饯���ؿ�
    def __init__(self,W,bias):

        self.inum=W.shape[0]
        self.nnum=W.shape[1]

        # ��ǥ�ѥ�᡼�����ΰ�γ���

        self.W   =theano.shared(value=W   ,name="W")
        self.Bias=theano.shared(value=bias,name="Bias")

        # �Ѳ��̤���¸�ΰ�γ���

        self.DiffW   =theano.shared(
            value=numpy.zeros(self.inum*self.nnum,
                              dtype=theano.config.floatX).reshape(self.inum,
                                                                  self.nnum),
            name="DiffW")
        self.DiffBias=theano.shared(
            value=numpy.zeros(self.nnum,dtype=theano.config.floatX),
            name="DiffBias")

        return

    # ���Ŵؿ�
    def forward(self,x):
        return T.nnet.softmax(T.dot(x,self.W)+self.Bias)

# ����åե�󥰴ؿ�

def shuffle_unison(dat, lab):
    
    rng_state = numpy.random.get_state()
    numpy.random.shuffle(dat)

    numpy.random.set_state(rng_state)
    numpy.random.shuffle(lab)

    return

# �ᥤ��ؿ�

if __name__ == "__main__":

    datfilename=sys.argv[1]         # ɾ���ǡ���
    labfilename=sys.argv[2]         # ɾ����٥�

    mlpdirname =sys.argv[3]         # ���ꤵ�줿 MLP ����¸�ǥ��쥯�ȥ�̾

    # ��ǥ�ѥ�᡼�����ΰ�γ��ݤ�����

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

                    
    # ɾ���ǡ������ɤ߹���

    test_dat=numpy.fromfile(datfilename,dtype=">f4")
    test_dat=test_dat.reshape(len(test_dat)/L1.inum,L1.inum)
    test_lab=numpy.fromfile(labfilename,dtype=">H")

    # �˥塼���ͥåȥ���ν��Ϥ�׻���������κ���

    x=T.fmatrix("x")
    p=L5.forward(L4.forward(L3.forward(L2.forward(L1.forward(x)))))

    # ɾ���� Python �ؿ�������

    y=T.ivector("y")
    err=T.sum(T.neq(T.argmax(p,axis=1),y))

    tester=theano.function(inputs=[x,y],outputs=err)

    # ɾ���¸�

    acc=(1.0-tester(test_dat,test_lab)/float(len(test_lab)))*100.0
    print "acc=%5.2f"%acc

