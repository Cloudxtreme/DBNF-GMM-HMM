#!/bin/bash
#PBS -N voice_AV 
#PBS -j oe
#PBS -k oe
#PBS -V
#PBS -l select=1:ncpus=1
#PBS -q q70
#PBS -m ae


FILELIST="test_all.list"
CONFIG="AV.jconf"
LOG="test_all.log"

LogDIR="${HOME}/work/work_multimodal/recog/av"
FlistDIR="${HOME}/work/work_multimodal/avlist"
JconfDIR="${HOME}/work/work_multimodal/config"

/home_2/h_ninomiya/work/Julius/dictation-kit-v4.3.1-linux/bin/julius-4.3.1-std \
	-C ${JconfDIR}/${CONFIG} \
	-filelist ${FlistDIR}/${FILELIST} \
	> ${LogDIR}/${LOG} 2>&1

