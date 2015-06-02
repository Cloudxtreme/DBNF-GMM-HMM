#! /bin/tcsh -f
# Written by Shigeki Matsuda (2013/10/23)
# Copyright (C) 2013 NICT
#
# 2013/12/21 Modified by Tomoki Hayashi
#   -出力先と入力先を指定できるように修正 
#   -平均分散ベクトルファイルを命名できるように修正
#   -平均分散を計算するかをON・OFFできるように修正


setenv DIR_IN "mfc429/clean"
setenv DIR_OUT "mfc429_norm/clean"
setenv DIST_DIR "prefs/distfile"
setenv DIST_NAME distfile_mfc429_clean
setenv SWITCH ON

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN}/${ID}.mfc429 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 429 \
        > ${DIST_DIR}/${DIST_NAME}

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT}

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN}/${ID}.mfc429 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME} \
      > ${DIR_OUT}/clean_${ID}.mfc429_norm
  end
end
