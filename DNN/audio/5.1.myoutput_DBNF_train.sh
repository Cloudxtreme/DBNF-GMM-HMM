#! /bin/tcsh -f
# DBNFを出力するプログラム
# 2013/01/22 by Tomoki Hayashi

setenv THEANO_FLAGS "floatX=float32,device=gpu"

# 各種パラメータの設定
# DIM：特徴量次元*4, 特徴量次元: 出力素子数
setenv DIR_MLP "MLP/DBNF/fuzy"
setenv DIR_IN "mfc429_norm/clean"
setenv DIR_OUT "output/DBNF/fuzy/clean"
setenv DIR_IN_NOISE "mfc429_norm/expressway"
setenv DIR_OUT_NOISE "output/DBNF/fuzy/expressway"
setenv DIM "160"
setenv SWITCH OFF

if ("${SWITCH}" == "ON") then
mkdir -p ${DIR_OUT}/train

./script/myoutput_mlp.py \
  ${DIR_MLP} \
  prefs/myids.train \
  ${DIR_IN} \
  ${DIR_OUT}/train \
  ${DIM}
endif

mkdir -p ${DIR_OUT_NOISE}/snr-5/train

./script/myoutput_mlp.py \
  ${DIR_MLP} \
  prefs/myids.train \
  ${DIR_IN_NOISE}/snr-5 \
  ${DIR_OUT_NOISE}/snr-5/train \
  ${DIM}

mkdir -p ${DIR_OUT_NOISE}/snr0/train

./script/myoutput_mlp.py \
  ${DIR_MLP} \
  prefs/myids.train \
  ${DIR_IN_NOISE}/snr0/ \
  ${DIR_OUT_NOISE}/snr0/train \
  ${DIM}

mkdir -p ${DIR_OUT_NOISE}/snr5/train

./script/myoutput_mlp.py \
  ${DIR_MLP} \
  prefs/myids.train \
  ${DIR_IN_NOISE}/snr5/ \
  ${DIR_OUT_NOISE}/snr5/train \
  ${DIM}

mkdir -p ${DIR_OUT_NOISE}/snr10/train

./script/myoutput_mlp.py \
  ${DIR_MLP} \
  prefs/myids.train \
  ${DIR_IN_NOISE}/snr10/ \
  ${DIR_OUT_NOISE}/snr10/train \
  ${DIM}

mkdir -p ${DIR_OUT_NOISE}/snr15/train

./script/myoutput_mlp.py \
  ${DIR_MLP} \
  prefs/myids.train \
  ${DIR_IN_NOISE}/snr15/ \
  ${DIR_OUT_NOISE}/snr15/train \
  ${DIM}

mkdir -p ${DIR_OUT_NOISE}/snr20/train

./script/myoutput_mlp.py \
  ${DIR_MLP} \
  prefs/myids.train \
  ${DIR_IN_NOISE}/snr20/ \
  ${DIR_OUT_NOISE}/snr20/train \
  ${DIM}

