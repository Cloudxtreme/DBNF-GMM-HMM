#! /bin/tcsh -f
# DBNF���o�͂���v���O����
# 2013/01/22 by Tomoki Hayashi

setenv THEANO_FLAGS "floatX=float32,device=gpu"

# �e��p�����[�^�̐ݒ�
# DIM�F�����ʎ���*4, �����ʎ���: �o�͑f�q��
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
