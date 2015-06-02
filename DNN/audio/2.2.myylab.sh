#! /bin/tcsh -f
# Written by Shigeki Matsuda (2013/10/23)
# Copyright (C) 2013 NICT
#
# 2013/12/21 Modified by Tomoki Hayashi
#   -入力先を指定できるように修正

setenv DIR_LAB "lab/clean"

mkdir -p ylab/clean

foreach SET ( train valid )
  cp /dev/null ylab/${SET}1.ylab
  foreach ID ( `cat id/clean/clean_ids.${SET}` )
    echo ${ID}
    cat ${DIR_LAB}/${ID}.* \
      | ./bin/ylab -mapfile prefs/mymapfile \
     >> ylab/clean/${SET}1.ylab
  end
end
