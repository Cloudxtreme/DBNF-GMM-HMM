#! /bin/tcsh -f
# Written by Shigeki Matsuda (2013/10/23)
# Copyright (C) 2013 NICT
#
# 2013/12/21 Modified by Tomoki Hayashi
#   -o—Íæ‚Æ“ü—Íæ‚ðŽw’è‚Å‚«‚é‚æ‚¤‚ÉC³ 

setenv DIR_IN_CLEAN "pdglc192"
setenv DIR_OUT_CLEAN "pdglc2112"

mkdir -p ${DIR_OUT_CLEAN}

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_CLEAN}/${ID}.pdglc192 \
      | ./bin/splice -veclen 192 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_CLEAN}/${ID}.pdglc2112
  end
end
