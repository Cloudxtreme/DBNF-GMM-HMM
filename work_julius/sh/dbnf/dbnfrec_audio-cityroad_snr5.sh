#!/bin/bash
#PBS -N voice_DBNF 
#PBS -j oe
#PBS -k oe
#PBS -V
#PBS -l select=1:ncpus=1
#PBS -q q70
#PBS -m ae


FILELIST="test_audio-cityroad_snr5.list"
CONFIG="DBNF.jconf"
LOG="test_audio-cityroad_snr5.log"

LogDIR="${HOME}/work/work_multimodal/recog/dbnf"
FlistDIR="${HOME}/work/work_multimodal/dbnflist"
JconfDIR="${HOME}/work/work_multimodal/config"

/home_2/h_ninomiya/work/Julius/dictation-kit-v4.3.1-linux/bin/julius-4.3.1-std \
	-C ${JconfDIR}/${CONFIG} \
	-filelist ${FlistDIR}/${FILELIST} \
	> ${LogDIR}/${LOG} 2>&1


