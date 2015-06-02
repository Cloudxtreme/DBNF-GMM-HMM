#! /bin/tcsh -f
# Written by Shigeki Matsuda (2013/10/23)
# Copyright (C) 2013 NICT
#
# 2013/12/21 Modified by Tomoki Hayashi
#   -“ü—Íæ‚ðŽw’è‚Å‚«‚é‚æ‚¤‚ÉC³ 

setenv DIR_IN "mfcpca759_norm/all"
setenv DIR_OUT "xdat/rand"

mkdir -p ${DIR_OUT}

foreach SET ( valid )
  cp /dev/null ${DIR_OUT}/${SET}1.xdat
  foreach ID ( `cat id/rand/all_ids.${SET}` )
    echo ${ID}
    cat ${DIR_IN}/${ID}.* \
     >> ${DIR_OUT}/${SET}1.xdat
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}1.xdat
  foreach ID ( `cat id/rand/all_ids1.${SET}` )
    echo ${ID}
    cat ${DIR_IN}/${ID}.* \
     >> ${DIR_OUT}/${SET}1.xdat
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}2.xdat
  foreach ID ( `cat id/rand/all_ids2.${SET}` )
    echo ${ID}
    cat ${DIR_IN}/${ID}.* \
     >> ${DIR_OUT}/${SET}2.xdat
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}3.xdat
  foreach ID ( `cat id/rand/all_ids3.${SET}` )
    echo ${ID}
    cat ${DIR_IN}/${ID}.* \
     >> ${DIR_OUT}/${SET}3.xdat
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}4.xdat
  foreach ID ( `cat id/rand/all_ids4.${SET}` )
    echo ${ID}
    cat ${DIR_IN}/${ID}.* \
     >> ${DIR_OUT}/${SET}4.xdat
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}5.xdat
  foreach ID ( `cat id/rand/all_ids5.${SET}` )
    echo ${ID}
    cat ${DIR_IN}/${ID}.* \
     >> ${DIR_OUT}/${SET}5.xdat
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}6.xdat
  foreach ID ( `cat id/rand/all_ids6.${SET}` )
    echo ${ID}
    cat ${DIR_IN}/${ID}.* \
     >> ${DIR_OUT}/${SET}6.xdat
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}7.xdat
  foreach ID ( `cat id/rand/all_ids7.${SET}` )
    echo ${ID}
    cat ${DIR_IN}/${ID}.* \
     >> ${DIR_OUT}/${SET}7.xdat
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}8.xdat
  foreach ID ( `cat id/rand/all_ids8.${SET}` )
    echo ${ID}
    cat ${DIR_IN}/${ID}.* \
     >> ${DIR_OUT}/${SET}8.xdat
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}9.xdat
  foreach ID ( `cat id/rand/all_ids9.${SET}` )
    echo ${ID}
    cat ${DIR_IN}/${ID}.* \
     >> ${DIR_OUT}/${SET}9.xdat
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}10.xdat
  foreach ID ( `cat id/rand/all_ids10.${SET}` )
    echo ${ID}
    cat ${DIR_IN}/${ID}.* \
     >> ${DIR_OUT}/${SET}10.xdat
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}11.xdat
  foreach ID ( `cat id/rand/all_ids11.${SET}` )
    echo ${ID}
    cat ${DIR_IN}/${ID}.* \
     >> ${DIR_OUT}/${SET}11.xdat
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}12.xdat
  foreach ID ( `cat id/rand/all_ids12.${SET}` )
    echo ${ID}
    cat ${DIR_IN}/${ID}.* \
     >> ${DIR_OUT}/${SET}12.xdat
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}13.xdat
  foreach ID ( `cat id/rand/all_ids13.${SET}` )
    echo ${ID}
    cat ${DIR_IN}/${ID}.* \
     >> ${DIR_OUT}/${SET}13.xdat
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}14.xdat
  foreach ID ( `cat id/rand/all_ids14.${SET}` )
    echo ${ID}
    cat ${DIR_IN}/${ID}.* \
     >> ${DIR_OUT}/${SET}14.xdat
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}15.xdat
  foreach ID ( `cat id/rand/all_ids15.${SET}` )
    echo ${ID}
    cat ${DIR_IN}/${ID}.* \
     >> ${DIR_OUT}/${SET}15.xdat
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}16.xdat
  foreach ID ( `cat id/rand/all_ids16.${SET}` )
    echo ${ID}
    cat ${DIR_IN}/${ID}.* \
     >> ${DIR_OUT}/${SET}16.xdat
  end
end
