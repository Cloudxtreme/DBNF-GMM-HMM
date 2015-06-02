#! /bin/tcsh -f
# DNN-HMMの確率を出力するプログラム
# 2013/01/22 by Tomoki Hayashi

setenv THEANO_FLAGS "floatX=float32,device=gpu"

# 各種パラメータの設定
# DIM：特徴量次元*4, 特徴量次元: 出力素子数
setenv DIR_MLP "MLP/DNN/fuzy"
setenv DIR_IN "mfc429_norm/clean"
setenv DIR_OUT "output/DNN/fuzy/clean"
setenv DIR_IN_NOISE "mfc429_norm/expressway"
setenv DIR_OUT_NOISE "output/DNN/fuzy/expressway"
setenv DIM "716"
setenv SWITCH OFF

if ("${SWITCH}" == "ON") then
mkdir -p ${DIR_OUT}/test

./script/myoutput_mlp_prob.py \
  ${DIR_MLP} \
  prefs/myids.test \
  ${DIR_IN} \
  ${DIR_OUT}/test \
  ${DIM}
endif

mkdir -p ${DIR_OUT_NOISE}/snr-5/test

./script/myoutput_mlp_prob.py \
  ${DIR_MLP} \
  prefs/myids.test \
  ${DIR_IN_NOISE}/snr-5 \
  ${DIR_OUT_NOISE}/snr-5/test \
  ${DIM}

mkdir -p ${DIR_OUT_NOISE}/snr0/test

./script/myoutput_mlp_prob.py \
  ${DIR_MLP} \
  prefs/myids.test \
  ${DIR_IN_NOISE}/snr0/ \
  ${DIR_OUT_NOISE}/snr0/test \
  ${DIM}

mkdir -p ${DIR_OUT_NOISE}/snr5/test

./script/myoutput_mlp_prob.py \
  ${DIR_MLP} \
  prefs/myids.test \
  ${DIR_IN_NOISE}/snr5/ \
  ${DIR_OUT_NOISE}/snr5/test \
  ${DIM}

mkdir -p ${DIR_OUT_NOISE}/snr10/test

./script/myoutput_mlp_prob.py \
  ${DIR_MLP} \
  prefs/myids.test \
  ${DIR_IN_NOISE}/snr10/ \
  ${DIR_OUT_NOISE}/snr10/test \
  ${DIM}

mkdir -p ${DIR_OUT_NOISE}/snr15/test

./script/myoutput_mlp_prob.py \
  ${DIR_MLP} \
  prefs/myids.test \
  ${DIR_IN_NOISE}/snr15/ \
  ${DIR_OUT_NOISE}/snr15/test \
  ${DIM}

mkdir -p ${DIR_OUT_NOISE}/snr20/test

./script/myoutput_mlp_prob.py \
  ${DIR_MLP} \
  prefs/myids.test \
  ${DIR_IN_NOISE}/snr20/ \
  ${DIR_OUT_NOISE}/snr20/test \
  ${DIM}
