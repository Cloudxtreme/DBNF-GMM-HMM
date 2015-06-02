#!/bin/bash
#PBS -N voice_DNN 
#PBS -j oe
#PBS -k oe
#PBS -V
#PBS -l select=1:ncpus=1
#PBS -q q70
#PBS -m ae


FILELIST="test_audio_snr15.list"
CONFIG="DNN.jconf"
LOG="test_audio_snr15.log"

LogDIR="${HOME}/work/work_multimodal/recog/prob"
FlistDIR="${HOME}/work/work_multimodal/problist"
JconfDIR="${HOME}/work/work_multimodal/config"

/home_2/h_ninomiya/work/Julius/dictation-kit-v4.3.1-linux/bin/julius-4.3.1-std \
	-C ${JconfDIR}/${CONFIG} \
	-filelist ${FlistDIR}/${FILELIST} \
	> ${LogDIR}/${LOG} 2>&1


