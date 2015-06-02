#! /bin/tcsh -f
# Written by Shigeki Matsuda (2013/10/23)
# Copyright (C) 2013 NICT
#
# 2013/12/21 Modified by Tomoki Hayashi
#   -入力先を指定できるように修正

setenv DIR_LAB "lab/fuzy"
setenv DIR_OUT "ylab/fuzy"

mkdir -p ${DIR_OUT}

foreach SET ( valid )
  cp /dev/null ${DIR_OUT}/${SET}1.ylab
  foreach ID ( `cat id/rand/all_ids.${SET}` )
    echo ${ID}
    cat ${DIR_LAB}/${ID}.* \
      | ./bin/ylab -mapfile prefs/mymapfile \
     >> ${DIR_OUT}/${SET}1.ylab
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}1.ylab
  foreach ID ( `cat id/rand/all_ids1.${SET}` )
    echo ${ID}
    cat ${DIR_LAB}/${ID}.* \
      | ./bin/ylab -mapfile prefs/mymapfile \
     >> ${DIR_OUT}/${SET}1.ylab
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}2.ylab
  foreach ID ( `cat id/rand/all_ids2.${SET}` )
    echo ${ID}
    cat ${DIR_LAB}/${ID}.* \
      | ./bin/ylab -mapfile prefs/mymapfile \
     >> ${DIR_OUT}/${SET}2.ylab
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}3.ylab
  foreach ID ( `cat id/rand/all_ids3.${SET}` )
    echo ${ID}
    cat ${DIR_LAB}/${ID}.* \
      | ./bin/ylab -mapfile prefs/mymapfile \
     >> ${DIR_OUT}/${SET}3.ylab
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}4.ylab
  foreach ID ( `cat id/rand/all_ids4.${SET}` )
    echo ${ID}
    cat ${DIR_LAB}/${ID}.* \
      | ./bin/ylab -mapfile prefs/mymapfile \
     >> ${DIR_OUT}/${SET}4.ylab
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}5.ylab
  foreach ID ( `cat id/rand/all_ids5.${SET}` )
    echo ${ID}
    cat ${DIR_LAB}/${ID}.* \
      | ./bin/ylab -mapfile prefs/mymapfile \
     >> ${DIR_OUT}/${SET}5.ylab
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}6.ylab
  foreach ID ( `cat id/rand/all_ids6.${SET}` )
    echo ${ID}
    cat ${DIR_LAB}/${ID}.* \
      | ./bin/ylab -mapfile prefs/mymapfile \
     >> ${DIR_OUT}/${SET}6.ylab
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}7.ylab
  foreach ID ( `cat id/rand/all_ids7.${SET}` )
    echo ${ID}
    cat ${DIR_LAB}/${ID}.* \
      | ./bin/ylab -mapfile prefs/mymapfile \
     >> ${DIR_OUT}/${SET}7.ylab
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}8.ylab
  foreach ID ( `cat id/rand/all_ids8.${SET}` )
    echo ${ID}
    cat ${DIR_LAB}/${ID}.* \
      | ./bin/ylab -mapfile prefs/mymapfile \
     >> ${DIR_OUT}/${SET}8.ylab
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}9.ylab
  foreach ID ( `cat id/rand/all_ids9.${SET}` )
    echo ${ID}
    cat ${DIR_LAB}/${ID}.* \
      | ./bin/ylab -mapfile prefs/mymapfile \
     >> ${DIR_OUT}/${SET}9.ylab
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}10.ylab
  foreach ID ( `cat id/rand/all_ids10.${SET}` )
    echo ${ID}
    cat ${DIR_LAB}/${ID}.* \
      | ./bin/ylab -mapfile prefs/mymapfile \
     >> ${DIR_OUT}/${SET}10.ylab
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}11.ylab
  foreach ID ( `cat id/rand/all_ids11.${SET}` )
    echo ${ID}
    cat ${DIR_LAB}/${ID}.* \
      | ./bin/ylab -mapfile prefs/mymapfile \
     >> ${DIR_OUT}/${SET}11.ylab
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}12.ylab
  foreach ID ( `cat id/rand/all_ids12.${SET}` )
    echo ${ID}
    cat ${DIR_LAB}/${ID}.* \
      | ./bin/ylab -mapfile prefs/mymapfile \
     >> ${DIR_OUT}/${SET}12.ylab
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}13.ylab
  foreach ID ( `cat id/rand/all_ids13.${SET}` )
    echo ${ID}
    cat ${DIR_LAB}/${ID}.* \
      | ./bin/ylab -mapfile prefs/mymapfile \
     >> ${DIR_OUT}/${SET}13.ylab
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}14.ylab
  foreach ID ( `cat id/rand/all_ids14.${SET}` )
    echo ${ID}
    cat ${DIR_LAB}/${ID}.* \
      | ./bin/ylab -mapfile prefs/mymapfile \
     >> ${DIR_OUT}/${SET}14.ylab
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}15.ylab
  foreach ID ( `cat id/rand/all_ids15.${SET}` )
    echo ${ID}
    cat ${DIR_LAB}/${ID}.* \
      | ./bin/ylab -mapfile prefs/mymapfile \
     >> ${DIR_OUT}/${SET}15.ylab
  end
end

foreach SET ( train )
  cp /dev/null ${DIR_OUT}/${SET}16.ylab
  foreach ID ( `cat id/rand/all_ids16.${SET}` )
    echo ${ID}
    cat ${DIR_LAB}/${ID}.* \
      | ./bin/ylab -mapfile prefs/mymapfile \
     >> ${DIR_OUT}/${SET}16.ylab
  end
end

#foreach SET ( train )
#  cp /dev/null ${DIR_OUT}/${SET}17.ylab
#  foreach ID ( `cat id/all/rand/all_ids17.${SET}` )
#    echo ${ID}
#    cat ${DIR_LAB}/${ID}.* \
#      | ./bin/ylab -mapfile prefs/mymapfile \
#     >> ${DIR_OUT}/${SET}17.ylab
#  end
#end

#foreach SET ( train )
#  cp /dev/null ${DIR_OUT}/${SET}18.ylab
#  foreach ID ( `cat id/all/rand/all_ids18.${SET}` )
#    echo ${ID}
#    cat ${DIR_LAB}/${ID}.* \
#      | ./bin/ylab -mapfile prefs/mymapfile \
#     >> ${DIR_OUT}/${SET}18.ylab
#  end
#end

#foreach SET ( train )
#  cp /dev/null ${DIR_OUT}/${SET}19.ylab
#  foreach ID ( `cat id/all/rand/all_ids19.${SET}` )
#    echo ${ID}
#    cat ${DIR_LAB}/${ID}.* \
#      | ./bin/ylab -mapfile prefs/mymapfile \
#     >> ${DIR_OUT}/${SET}19.ylab
#  end
#end
