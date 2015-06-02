#! /bin/tcsh -f
# Written by Shigeki Matsuda (2013/10/23)
# Copyright (C) 2013 NICT
#
# 2013/12/21 Modified by Tomoki Hayashi
#   -o—Íæ‚Æ“ü—Íæ‚ğw’è‚Å‚«‚é‚æ‚¤‚ÉC³ 

setenv DIR_IN_CLEAN "~/work/pdglc"
setenv DIR_OUT_CLEAN "pdglc192"

mkdir -p ${DIR_OUT_CLEAN}

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE `mktemp`
    cp ${DIR_IN_CLEAN}/${ID}.pdglc ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_CLEAN}/${ID}.pdglc192
    rm ${TMPFILE}*
  end
end
