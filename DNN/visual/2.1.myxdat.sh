#! /bin/tcsh -f
# Written by Shigeki Matsuda (2013/10/23)
# Copyright (C) 2013 NICT
#
# 2013/12/21 Modified by Tomoki Hayashi
#   -“ü—Íæ‚ðŽw’è‚Å‚«‚é‚æ‚¤‚ÉC³ 

setenv DIR_IN "pdglc2112_norm"
setenv DIR_OUT "xdat"

mkdir -p ${DIR_OUT}

foreach SET ( valid )
  cp /dev/null ${DIR_OUT}/${SET}1.xdat
  foreach ID ( `cat id/ids.${SET}` )
    echo ${ID}
    cat ${DIR_IN}/${ID}.* \
     >> ${DIR_OUT}/${SET}1.xdat
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}1.xdat
  foreach ID ( `cat id/ids.${SET}` )
    echo ${ID}
    cat ${DIR_IN}/${ID}.* \
     >> ${DIR_OUT}/${SET}1.xdat
  end
end
