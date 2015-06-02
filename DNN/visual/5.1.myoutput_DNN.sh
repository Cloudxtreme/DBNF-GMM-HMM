#! /bin/tcsh -f
# DNN-HMMの確率を出力するプログラム
# 2013/01/22 by Tomoki Hayashi

setenv THEANO_FLAGS "floatX=float32,device=gpu"

# 各種パラメータの設定
# DIM：特徴量次元*4, 特徴量次元: 出力素子数
setenv DIR_MLP "MLP/DNN/fuz"
setenv DIR_IN "pca330_norm"
setenv DIR_OUT "output/DNN/fuz"
setenv DIM "716"

mkdir -p ${DIR_OUT}/test

./script/myoutput_mlp_prob.py \
  ${DIR_MLP} \
  prefs/myids.test \
  ${DIR_IN} \
  ${DIR_OUT}/test \
  ${DIM}
