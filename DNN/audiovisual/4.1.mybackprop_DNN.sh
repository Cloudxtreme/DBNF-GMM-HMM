#! /bin/tcsh -f
# Written by Shigeki Matsuda (2013/10/23)
# Copyright (C) 2013 NICT
#
# 2013/12/21 Modified by Tomoki Hayashi
#   -���͐�Əo�͐���w��ł���悤�ɏC�� 
#   -�p�����[�^���ŏ��ɐݒ肷��悤�ɏC��

setenv THEANO_FLAGS "floatX=float32,device=gpu"

# �e��p�����[�^�̐ݒ�
setenv DIR_RBM "RBM/DNN/rand"
setenv DIR_MLP "MLP/DNN/fuz"
setenv DIR_XDAT "xdat/rand"
setenv EPOCH "50"
setenv BATCH "256"
setenv LR "0.006"
setenv MOM "0.0"
setenv COST "0.0"
setenv NUM "5"

mkdir -p ${DIR_MLP}

./script/train_mlp_layer_${NUM}.py \
  ${DIR_XDAT}/train \
  ylab/fuz/train \
  ${DIR_XDAT}/valid1.xdat \
  ylab/fuz/valid1.ylab \
  ${DIR_RBM} \
  ${DIR_MLP}/ \
  1234 \
  ${EPOCH} \
  ${BATCH} \
  ${LR} \
  ${MOM} \
  ${COST} \
  | tee ${DIR_MLP}/train.log
  
