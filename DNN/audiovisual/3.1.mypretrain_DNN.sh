#! /bin/tcsh -f
# Written by Shigeki Matsuda (2013/5/23)
# Copyright (C) 2013 NICT
#
# 2013/12/21 Modified by Tomoki Hayashi
#   -すべての事前学習を一つで行うように修正
#   -サンプリングに利用する前の層の出力を削除するように修正
#   -保存先のフォルダネームを指定できるように修正

setenv THEANO_FLAGS "floatX=float32,device=gpu"
setenv DIR_RBM "RBM/DNN/rand"
setenv DIR_XDAT "xdat/rand"

####### 第一層 ##################################################################
mkdir -p ${DIR_RBM}/L1

./script/train_rbm.py \
  ${DIR_XDAT}/train \
  ${DIR_RBM}/L1/rbm \
  1234 \
  2048 \
  759 \
  5 \
  256 \
  0.004 \
  0.9 \
  0.0 \
  GB \
  | tee ${DIR_RBM}/L1/rbm.log 

./script/fprop_rbm.py \
  ${DIR_XDAT}/train \
  ${DIR_RBM}/L1/out \
  ${DIR_RBM}/L1/rbm \
  256
  
####### 第二層 ###############################################################
foreach LAYER ( 2 )
  setenv PREV_LAYER `expr ${LAYER} - 1`

  mkdir -p ${DIR_RBM}/L${LAYER}

  ./script/train_rbm.py \
    ${DIR_RBM}/L${PREV_LAYER}/out \
    ${DIR_RBM}/L${LAYER}/rbm \
    1234 \
    2048 \
    2048 \
    5 \
    256 \
    0.004 \
    0.9 \
    0.0 \
    BB \
    | tee ${DIR_RBM}/L${LAYER}/rbm.log

  ./script/fprop_rbm.py \
    ${DIR_RBM}/L${PREV_LAYER}/out \
    ${DIR_RBM}/L${LAYER}/out \
    ${DIR_RBM}/L${LAYER}/rbm \
    256

  rm -fv ${DIR_RBM}/L${PREV_LAYER}/out*

end

####### 第3層 ############################################################
foreach LAYER ( 3 )
  setenv PREV_LAYER `expr ${LAYER} - 1`

  mkdir -p ${DIR_RBM}/L${LAYER}

  ./script/train_rbm.py \
    ${DIR_RBM}/L${PREV_LAYER}/out \
    ${DIR_RBM}/L${LAYER}/rbm \
    1234 \
    2048 \
    2048 \
    5 \
    256 \
    0.004 \
    0.9 \
    0.0 \
    BB \
    | tee ${DIR_RBM}/L${LAYER}/rbm.log

end

####### 第4層 ############################################################
mkdir -p ${DIR_RBM}/L4

./script/train_rbm.py \
  /dev/null \
  ${DIR_RBM}/L4/rbm \
  1234 \
  `wc -l prefs/mymapfile | awk '{print $1}'` \
  2048 \
  0 \
  256 \
  0.0 \
  0.0 \
  0.0 \
  False


