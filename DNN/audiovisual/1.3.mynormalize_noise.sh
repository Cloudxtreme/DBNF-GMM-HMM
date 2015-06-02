#! /bin/tcsh -f
# Written by Shigeki Matsuda (2013/10/23)
# Copyright (C) 2013 NICT
#
# 2013/12/21 Modified by Tomoki Hayashi
#   -出力先と入力先を指定できるように修正 
#   -平均分散ベクトルファイルを命名できるように修正
#   -平均分散を計算するかをON・OFFできるように修正

setenv AUDIO_NAME audio
setenv AUDIO_CITYROAD_NAME audio-cityroad
setenv AUDIO_EXPRESSWAY_NAME audio-expressway
setenv CITYROAD_NAME cityroad
setenv EXPRESSWAY_NAME expressway
setenv DIR_IN_AUDIO "mfcpca759/audio"
setenv DIR_OUT_AUDIO "mfcpca759_norm/audio"
setenv DIR_IN_AUDIO_CITYROAD "mfcpca759/audio-cityroad"
setenv DIR_OUT_AUDIO_CITYROAD "mfcpca759_norm/audio-cityroad"
setenv DIR_IN_AUDIO_EXPRESSWAY "mfcpca759/audio-expressway"
setenv DIR_OUT_AUDIO_EXPRESSWAY "mfcpca759_norm/audio-expressway"
setenv DIR_IN_CITYROAD "mfcpca759/cityroad"
setenv DIR_OUT_CITYROAD "mfcpca759_norm/cityroad"
setenv DIR_IN_EXPRESSWAY "mfcpca759/expressway"
setenv DIR_OUT_EXPRESSWAY "mfcpca759_norm/expressway"
setenv DIST_DIR "prefs/distfile"
setenv DIST_NAME distfile
setenv SWITCH ON

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_AUDIO}/snr-5/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${AUDIO_NAME}_snr-5

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_AUDIO}/snr-5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO}/snr-5/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${AUDIO_NAME}_snr-5 \
      > ${DIR_OUT_AUDIO}/snr-5/${AUDIO_NAME}_snr-5_${ID}.mfcpca759_norm
  end
end

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_AUDIO}/snr0/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${AUDIO_NAME}_snr0

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_AUDIO}/snr0

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO}/snr0/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${AUDIO_NAME}_snr0 \
      > ${DIR_OUT_AUDIO}/snr0/${AUDIO_NAME}_snr0_${ID}.mfcpca759_norm
  end
end

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_AUDIO}/snr5/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${AUDIO_NAME}_snr5

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_AUDIO}/snr5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO}/snr5/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${AUDIO_NAME}_snr5 \
      > ${DIR_OUT_AUDIO}/snr5/${AUDIO_NAME}_snr5_${ID}.mfcpca759_norm
  end
end

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_AUDIO}/snr10/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${AUDIO_NAME}_snr10

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_AUDIO}/snr10

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO}/snr10/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${AUDIO_NAME}_snr10 \
      > ${DIR_OUT_AUDIO}/snr10/${AUDIO_NAME}_snr10_${ID}.mfcpca759_norm
  end
end

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_AUDIO}/snr15/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${AUDIO_NAME}_snr15

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_AUDIO}/snr15

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO}/snr15/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${AUDIO_NAME}_snr15 \
      > ${DIR_OUT_AUDIO}/snr15/${AUDIO_NAME}_snr15_${ID}.mfcpca759_norm
  end
end

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_AUDIO}/snr20/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${AUDIO_NAME}_snr20

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_AUDIO}/snr20

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO}/snr20/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${AUDIO_NAME}_snr20 \
      > ${DIR_OUT_AUDIO}/snr20/${AUDIO_NAME}_snr20_${ID}.mfcpca759_norm
  end
end


# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_AUDIO_CITYROAD}/snr-5/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${AUDIO_CITYROAD_NAME}_snr-5

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_AUDIO_CITYROAD}/snr-5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO_CITYROAD}/snr-5/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${AUDIO_CITYROAD_NAME}_snr-5 \
      > ${DIR_OUT_AUDIO_CITYROAD}/snr-5/${AUDIO_CITYROAD_NAME}_snr-5_${ID}.mfcpca759_norm
  end
end

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_AUDIO_CITYROAD}/snr0/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${AUDIO_CITYROAD_NAME}_snr0

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_AUDIO_CITYROAD}/snr0

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO_CITYROAD}/snr0/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${AUDIO_CITYROAD_NAME}_snr0 \
      > ${DIR_OUT_AUDIO_CITYROAD}/snr0/${AUDIO_CITYROAD_NAME}_snr0_${ID}.mfcpca759_norm
  end
end

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_AUDIO_CITYROAD}/snr5/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${AUDIO_CITYROAD_NAME}_snr5

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_AUDIO_CITYROAD}/snr5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO_CITYROAD}/snr5/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${AUDIO_CITYROAD_NAME}_snr5 \
      > ${DIR_OUT_AUDIO_CITYROAD}/snr5/${AUDIO_CITYROAD_NAME}_snr5_${ID}.mfcpca759_norm
  end
end

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_AUDIO_CITYROAD}/snr10/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${AUDIO_CITYROAD_NAME}_snr10

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_AUDIO_CITYROAD}/snr10

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO_CITYROAD}/snr10/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${AUDIO_CITYROAD_NAME}_snr10 \
      > ${DIR_OUT_AUDIO_CITYROAD}/snr10/${AUDIO_CITYROAD_NAME}_snr10_${ID}.mfcpca759_norm
  end
end

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_AUDIO_CITYROAD}/snr15/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${AUDIO_CITYROAD_NAME}_snr15

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_AUDIO_CITYROAD}/snr15

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO_CITYROAD}/snr15/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${AUDIO_CITYROAD_NAME}_snr15 \
      > ${DIR_OUT_AUDIO_CITYROAD}/snr15/${AUDIO_CITYROAD_NAME}_snr15_${ID}.mfcpca759_norm
  end
end

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_AUDIO_CITYROAD}/snr20/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${AUDIO_CITYROAD_NAME}_snr20

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_AUDIO_CITYROAD}/snr20

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO_CITYROAD}/snr20/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${AUDIO_CITYROAD_NAME}_snr20 \
      > ${DIR_OUT_AUDIO_CITYROAD}/snr20/${AUDIO_CITYROAD_NAME}_snr20_${ID}.mfcpca759_norm
  end
end

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_AUDIO_EXPRESSWAY}/snr-5/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${AUDIO_EXPRESSWAY_NAME}_snr-5

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_AUDIO_EXPRESSWAY}/snr-5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO_EXPRESSWAY}/snr-5/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${AUDIO_EXPRESSWAY_NAME}_snr-5 \
      > ${DIR_OUT_AUDIO_EXPRESSWAY}/snr-5/${AUDIO_EXPRESSWAY_NAME}_snr-5_${ID}.mfcpca759_norm
  end
end

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_AUDIO_EXPRESSWAY}/snr0/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${AUDIO_EXPRESSWAY_NAME}_snr0

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_AUDIO_EXPRESSWAY}/snr0

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO_EXPRESSWAY}/snr0/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${AUDIO_EXPRESSWAY_NAME}_snr0 \
      > ${DIR_OUT_AUDIO_EXPRESSWAY}/snr0/${AUDIO_EXPRESSWAY_NAME}_snr0_${ID}.mfcpca759_norm
  end
end

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_AUDIO_EXPRESSWAY}/snr5/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${AUDIO_EXPRESSWAY_NAME}_snr5

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_AUDIO_EXPRESSWAY}/snr5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO_EXPRESSWAY}/snr5/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${AUDIO_EXPRESSWAY_NAME}_snr5 \
      > ${DIR_OUT_AUDIO_EXPRESSWAY}/snr5/${AUDIO_EXPRESSWAY_NAME}_snr5_${ID}.mfcpca759_norm
  end
end

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_AUDIO_EXPRESSWAY}/snr10/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${AUDIO_EXPRESSWAY_NAME}_snr10

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_AUDIO_EXPRESSWAY}/snr10

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO_EXPRESSWAY}/snr10/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${AUDIO_EXPRESSWAY_NAME}_snr10 \
      > ${DIR_OUT_AUDIO_EXPRESSWAY}/snr10/${AUDIO_EXPRESSWAY_NAME}_snr10_${ID}.mfcpca759_norm
  end
end

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_AUDIO_EXPRESSWAY}/snr15/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${AUDIO_EXPRESSWAY_NAME}_snr15

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_AUDIO_EXPRESSWAY}/snr15

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO_EXPRESSWAY}/snr15/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${AUDIO_EXPRESSWAY_NAME}_snr15 \
      > ${DIR_OUT_AUDIO_EXPRESSWAY}/snr15/${AUDIO_EXPRESSWAY_NAME}_snr15_${ID}.mfcpca759_norm
  end
end

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_AUDIO_EXPRESSWAY}/snr20/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${AUDIO_EXPRESSWAY_NAME}_snr20

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_AUDIO_EXPRESSWAY}/snr20

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO_EXPRESSWAY}/snr20/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${AUDIO_EXPRESSWAY_NAME}_snr20 \
      > ${DIR_OUT_AUDIO_EXPRESSWAY}/snr20/${AUDIO_EXPRESSWAY_NAME}_snr20_${ID}.mfcpca759_norm
  end
end

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_CITYROAD}/snr-5/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${CITYROAD_NAME}_snr-5

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_CITYROAD}/snr-5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_CITYROAD}/snr-5/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${CITYROAD_NAME}_snr-5 \
      > ${DIR_OUT_CITYROAD}/snr-5/${CITYROAD_NAME}_snr-5_${ID}.mfcpca759_norm
  end
end

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_CITYROAD}/snr0/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${CITYROAD_NAME}_snr0

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_CITYROAD}/snr0

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_CITYROAD}/snr0/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${CITYROAD_NAME}_snr0 \
      > ${DIR_OUT_CITYROAD}/snr0/${CITYROAD_NAME}_snr0_${ID}.mfcpca759_norm
  end
end

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_CITYROAD}/snr5/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${CITYROAD_NAME}_snr5

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_CITYROAD}/snr5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_CITYROAD}/snr5/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${CITYROAD_NAME}_snr5 \
      > ${DIR_OUT_CITYROAD}/snr5/${CITYROAD_NAME}_snr5_${ID}.mfcpca759_norm
  end
end

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_CITYROAD}/snr10/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${CITYROAD_NAME}_snr10

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_CITYROAD}/snr10

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_CITYROAD}/snr10/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${CITYROAD_NAME}_snr10 \
      > ${DIR_OUT_CITYROAD}/snr10/${CITYROAD_NAME}_snr10_${ID}.mfcpca759_norm
  end
end

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_CITYROAD}/snr15/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${CITYROAD_NAME}_snr15

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_CITYROAD}/snr15

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_CITYROAD}/snr15/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${CITYROAD_NAME}_snr15 \
      > ${DIR_OUT_CITYROAD}/snr15/${CITYROAD_NAME}_snr15_${ID}.mfcpca759_norm
  end
end

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_CITYROAD}/snr20/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${CITYROAD_NAME}_snr20

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_CITYROAD}/snr20

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_CITYROAD}/snr20/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${CITYROAD_NAME}_snr20 \
      > ${DIR_OUT_CITYROAD}/snr20/${CITYROAD_NAME}_snr20_${ID}.mfcpca759_norm
  end
end

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_EXPRESSWAY}/snr-5/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${EXPRESSWAY_NAME}_snr-5

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_EXPRESSWAY}/snr-5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_EXPRESSWAY}/snr-5/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${EXPRESSWAY_NAME}_snr-5 \
      > ${DIR_OUT_EXPRESSWAY}/snr-5/${EXPRESSWAY_NAME}_snr-5_${ID}.mfcpca759_norm
  end
end

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_EXPRESSWAY}/snr0/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${EXPRESSWAY_NAME}_snr0

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_EXPRESSWAY}/snr0

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_EXPRESSWAY}/snr0/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${EXPRESSWAY_NAME}_snr0 \
      > ${DIR_OUT_EXPRESSWAY}/snr0/${EXPRESSWAY_NAME}_snr0_${ID}.mfcpca759_norm
  end
end

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_EXPRESSWAY}/snr5/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${EXPRESSWAY_NAME}_snr5

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_EXPRESSWAY}/snr5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_EXPRESSWAY}/snr5/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${EXPRESSWAY_NAME}_snr5 \
      > ${DIR_OUT_EXPRESSWAY}/snr5/${EXPRESSWAY_NAME}_snr5_${ID}.mfcpca759_norm
  end
end

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_EXPRESSWAY}/snr10/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${EXPRESSWAY_NAME}_snr10

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_EXPRESSWAY}/snr10

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_EXPRESSWAY}/snr10/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${EXPRESSWAY_NAME}_snr10 \
      > ${DIR_OUT_EXPRESSWAY}/snr10/${EXPRESSWAY_NAME}_snr10_${ID}.mfcpca759_norm
  end
end

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_EXPRESSWAY}/snr15/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${EXPRESSWAY_NAME}_snr15

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_EXPRESSWAY}/snr15

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_EXPRESSWAY}/snr15/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${EXPRESSWAY_NAME}_snr15 \
      > ${DIR_OUT_EXPRESSWAY}/snr15/${EXPRESSWAY_NAME}_snr15_${ID}.mfcpca759_norm
  end
end

# 平均分散ベクトルの計算

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN_EXPRESSWAY}/snr20/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}_${EXPRESSWAY_NAME}_snr20

      rm ${TMPFILE}*
endif

# 平均分散の正規化

mkdir -p ${DIR_OUT_EXPRESSWAY}/snr20

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_EXPRESSWAY}/snr20/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME}_${EXPRESSWAY_NAME}_snr20 \
      > ${DIR_OUT_EXPRESSWAY}/snr20/${EXPRESSWAY_NAME}_snr20_${ID}.mfcpca759_norm
  end
end
