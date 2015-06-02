#! /bin/tcsh -f
# DNN-HMM�̊m�����o�͂���v���O����
# 2013/01/22 by Tomoki Hayashi

setenv THEANO_FLAGS "floatX=float32,device=gpu"

# �e��p�����[�^�̐ݒ�
# DIM�F�����ʎ���*4, �����ʎ���: �o�͑f�q��
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
