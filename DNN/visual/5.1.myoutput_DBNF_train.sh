#! /bin/tcsh -f
# DBNFを出力するプログラム
# 2013/01/22 by Tomoki Hayashi

setenv THEANO_FLAGS "floatX=float32,device=gpu"

# 各種パラメータの設定
# DIM：特徴量次元*4, 特徴量次元: 出力素子数
setenv DIR_MLP "MLP/DBNF/rand"
setenv DIR_IN "pdglc2112_norm"
setenv DIR_OUT "output/DBNF/rand"
setenv DIM "160"

mkdir -p ${DIR_OUT}/train

./script/myoutput_mlp.py \
  ${DIR_MLP} \
  prefs/myids.train \
  ${DIR_IN} \
  ${DIR_OUT}/train \
  ${DIM}
