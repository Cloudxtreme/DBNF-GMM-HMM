#! /bin/tcsh -f
# Written by Shigeki Matsuda (2013/10/23)
# Copyright (C) 2013 NICT
#
# 2013/12/21 Modified by Tomoki Hayashi
#   -入力先を指定できるように修正

setenv DIR_LAB "lab/rand"
setenv DIR_OUT "ylab/rand"

mkdir -p ${DIR_OUT}

foreach SET ( valid )
  cp /dev/null ${DIR_OUT}/${SET}1.ylab
  foreach ID ( `cat id/ids.${SET}` )
    echo ${ID}
    cat ${DIR_LAB}/${ID}.* \
      | ./bin/ylab -mapfile prefs/mymapfile \
     >> ${DIR_OUT}/${SET}1.ylab
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}1.ylab
  foreach ID ( `cat id/ids.${SET}` )
    echo ${ID}
    cat ${DIR_LAB}/${ID}.* \
      | ./bin/ylab -mapfile prefs/mymapfile \
     >> ${DIR_OUT}/${SET}1.ylab
  end
end
