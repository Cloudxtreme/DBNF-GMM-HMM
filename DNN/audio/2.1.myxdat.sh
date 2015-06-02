#! /bin/tcsh -f
# Written by Shigeki Matsuda (2013/10/23)
# Copyright (C) 2013 NICT
#
# 2013/12/21 Modified by Tomoki Hayashi
#   -“ü—Íæ‚ðŽw’è‚Å‚«‚é‚æ‚¤‚ÉC³ 

setenv DIR_IN "mfc429_norm/clean"
setenv DIR_OUT "xdat/clean/"

mkdir -p ${DIR_OUT}

foreach SET ( test train valid )
  cp /dev/null ${DIR_OUT}/${SET}1.xdat
  foreach ID ( `cat id/clean/clean_ids.${SET}` )
    echo ${ID}
    cat ${DIR_IN}/${ID}.* \
     >> ${DIR_OUT}/${SET}1.xdat
  end
end
