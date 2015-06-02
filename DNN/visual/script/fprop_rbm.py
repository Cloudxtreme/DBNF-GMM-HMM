#! /usr/bin/python
# -*- coding: euc-jp -*-
# Written by Shigeki Matsuda
# Copyright (C) 2013 NICT

import sys

import numpy
import theano
import theano.tensor as T

# �����������

datfilename=sys.argv[1]       # ���ϥǡ����Υե�����̾
outfilename=sys.argv[2]       # ���ϥǡ����Υե�����̾
rbmfilename=sys.argv[3]       # RBM ����ե�����̾

mbsize     =int(sys.argv[4])  # �ߥ˥Хå�������

# ��ǥ�ѥ�᡼�����ɤ߹��ߤ��ΰ�γ���

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


# ���Ťο����κ���

v0act=T.fmatrix("v0act")
h0act=T.nnet.sigmoid(T.dot(v0act,W  )+HBias)

# ���Ϸ׻��� Python �ؿ��κ���

propageter=theano.function(inputs=[v0act],outputs=h0act)

# ���ϥǡ����η׻�����
for i in range(1,2):
     # �ؽ������ϥǡ����ե�������ɤ߹���
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
