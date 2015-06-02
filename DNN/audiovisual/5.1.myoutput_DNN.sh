#! /bin/tcsh -f
# DNN-HMM�̊m�����o�͂���v���O����
# 2013/01/22 by Tomoki Hayashi

setenv THEANO_FLAGS "floatX=float32,device=gpu"

# �e��p�����[�^�̐ݒ�
# DIM�F�����ʎ���*4, �����ʎ���: �o�͑f�q��
setenv DIR_MLP "MLP/DNN/fuz"
setenv DIR_IN "mfcpca759_norm/clean"
setenv DIR_OUT "output/DNN/fuz/clean"
setenv DIR_IN_NOISE "mfcpca759_norm/expressway"
setenv DIR_OUT_NOISE "output/DNN/fuz/expressway"
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
