#! /bin/tcsh -f
# Written by Shigeki Matsuda (2013/10/23)
# Copyright (C) 2013 NICT
#
# 2013/12/21 Modified by Tomoki Hayashi
#   -Ç∑Ç◊ÇƒÇÃéñëOäwèKÇàÍÇ¬Ç≈çsÇ§ÇÊÇ§Ç…èCê≥
#   -ÉTÉìÉvÉäÉìÉOÇ…óòópÇ∑ÇÈëOÇÃëwÇÃèoóÕÇçÌèúÇ∑ÇÈÇÊÇ§Ç…èCê≥
#   -ï€ë∂êÊÇÃÉtÉHÉãÉ_ÉlÅ[ÉÄÇéwíËÇ≈Ç´ÇÈÇÊÇ§Ç…èCê≥

setenv THEANO_FLAGS "floatX=float32,device=gpu"
setenv DIR_RBM "RBM/DBNF/rand"
setenv DIR_XDAT "xdat"

####### ëÊ1ëw ##################################################################
mkdir -p ${DIR_RBM}/L1

./script/train_rbm.py \
  ${DIR_XDAT}/train \
  ${DIR_RBM}/L1/rbm \
  1234 \
  2048 \
  2112 \
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
  
####### ëÊ2ëw ###############################################################
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

####### ëÊ3ëw ###############################################################
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

  ./script/fprop_rbm.py \
    ${DIR_RBM}/L${PREV_LAYER}/out \
    ${DIR_RBM}/L${LAYER}/out \
    ${DIR_RBM}/L${LAYER}/rbm \
    256

  rm -fv ${DIR_RBM}/L${PREV_LAYER}/out*

end

####### ëÊ4ëw ############################################################
foreach LAYER ( 4 )
  setenv PREV_LAYER `expr ${LAYER} - 1`

  mkdir -p ${DIR_RBM}/L${LAYER}

  ./script/train_rbm.py \
    ${DIR_RBM}/L${PREV_LAYER}/out \
    ${DIR_RBM}/L${LAYER}/rbm \
    1234 \
    40 \
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

####### ëÊ5ëw ############################################################
foreach LAYER ( 5 )
  setenv PREV_LAYER `expr ${LAYER} - 1`

  mkdir -p ${DIR_RBM}/L${LAYER}

  ./script/train_rbm.py \
    ${DIR_RBM}/L${PREV_LAYER}/out \
    ${DIR_RBM}/L${LAYER}/rbm \
    1234 \
    2048 \
    40 \
    5 \
    256 \
    0.004 \
    0.9 \
    0.0 \
    BB \
    | tee ${DIR_RBM}/L${LAYER}/rbm.log

  rm -fv ${DIR_RBM}/L${PREV_LAYER}/out*

end

####### ëÊ6ëw ############################################################
mkdir -p ${DIR_RBM}/L6

./script/train_rbm.py \
  /dev/null \
  ${DIR_RBM}/L6/rbm \
  1234 \
  `wc -l prefs/mymapfile | awk '{print $1}'` \
  2048 \
  0 \
  256 \
  0.0 \
  0.0 \
  0.0 \
  False


