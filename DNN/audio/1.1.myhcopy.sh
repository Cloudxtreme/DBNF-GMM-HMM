#! /bin/tcsh -f
# Written by Shigeki Matsuda (2013/10/23)
# Copyright (C) 2013 NICT
#
# 2013/12/21 Modified by Tomoki Hayashi
#   -èoóÕêÊÇ∆ì¸óÕêÊÇéwíËÇ≈Ç´ÇÈÇÊÇ§Ç…èCê≥ 

setenv DIR_IN_CLEAN "~/work/wav/clean"
setenv DIR_OUT_CLEAN "mfc039/clean"
setenv DIR_IN_AUDIO "~/work/wav/audio"
setenv DIR_OUT_AUDIO "mfc039/audio"
setenv DIR_IN_AUDIO_CITYROAD "~/work/wav/audio-cityroad"
setenv DIR_OUT_AUDIO_CITYROAD "mfc039/audio-cityroad"
setenv DIR_IN_AUDIO_EXPRESSWAY "~/work/wav/audio-expressway"
setenv DIR_OUT_AUDIO_EXPRESSWAY "mfc039/audio-expressway"
setenv DIR_IN_CITYROAD "~/work/wav/cityroad"
setenv DIR_OUT_CITYROAD "mfc039/cityroad"
setenv DIR_IN_EXPRESSWAY "~/work/wav/expressway"
setenv DIR_OUT_EXPRESSWAY "mfc039/expressway"

mkdir -p ${DIR_OUT_CLEAN}

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_CLEAN}/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_CLEAN}/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_AUDIO}/snr-5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_AUDIO}/snr-5/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_AUDIO}/snr-5/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_AUDIO}/snr0

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_AUDIO}/snr0/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_AUDIO}/snr0/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_AUDIO}/snr5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_AUDIO}/snr5/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_AUDIO}/snr5/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_AUDIO}/snr10

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_AUDIO}/snr10/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_AUDIO}/snr10/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_AUDIO}/snr15

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_AUDIO}/snr15/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_AUDIO}/snr15/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_AUDIO}/snr20

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_AUDIO}/snr20/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_AUDIO}/snr20/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_AUDIO_CITYROAD}/snr-5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_AUDIO_CITYROAD}/snr-5/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_AUDIO_CITYROAD}/snr-5/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_AUDIO_CITYROAD}/snr0

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_AUDIO_CITYROAD}/snr0/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_AUDIO_CITYROAD}/snr0/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_AUDIO_CITYROAD}/snr5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_AUDIO_CITYROAD}/snr5/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_AUDIO_CITYROAD}/snr5/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_AUDIO_CITYROAD}/snr10

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_AUDIO_CITYROAD}/snr10/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_AUDIO_CITYROAD}/snr10/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_AUDIO_CITYROAD}/snr15

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_AUDIO_CITYROAD}/snr15/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_AUDIO_CITYROAD}/snr15/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_AUDIO_CITYROAD}/snr20

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_AUDIO_CITYROAD}/snr20/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_AUDIO_CITYROAD}/snr20/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_AUDIO_EXPRESSWAY}/snr-5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_AUDIO_EXPRESSWAY}/snr-5/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_AUDIO_EXPRESSWAY}/snr-5/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_AUDIO_EXPRESSWAY}/snr0

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_AUDIO_EXPRESSWAY}/snr0/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_AUDIO_EXPRESSWAY}/snr0/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_AUDIO_EXPRESSWAY}/snr5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_AUDIO_EXPRESSWAY}/snr5/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_AUDIO_EXPRESSWAY}/snr5/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_AUDIO_EXPRESSWAY}/snr10

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_AUDIO_EXPRESSWAY}/snr10/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_AUDIO_EXPRESSWAY}/snr10/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_AUDIO_EXPRESSWAY}/snr15

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_AUDIO_EXPRESSWAY}/snr15/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_AUDIO_EXPRESSWAY}/snr15/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_AUDIO_EXPRESSWAY}/snr20

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_AUDIO_EXPRESSWAY}/snr20/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_AUDIO_EXPRESSWAY}/snr20/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_CITYROAD}/snr-5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_CITYROAD}/snr-5/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_CITYROAD}/snr-5/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_CITYROAD}/snr0

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_CITYROAD}/snr0/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_CITYROAD}/snr0/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_CITYROAD}/snr5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_CITYROAD}/snr5/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_CITYROAD}/snr5/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_CITYROAD}/snr10

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_CITYROAD}/snr10/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_CITYROAD}/snr10/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_CITYROAD}/snr15

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_CITYROAD}/snr15/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_CITYROAD}/snr15/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_CITYROAD}/snr20

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_CITYROAD}/snr20/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_CITYROAD}/snr20/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_EXPRESSWAY}/snr-5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_EXPRESSWAY}/snr-5/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_EXPRESSWAY}/snr-5/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_EXPRESSWAY}/snr0

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_EXPRESSWAY}/snr0/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_EXPRESSWAY}/snr0/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_EXPRESSWAY}/snr5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_EXPRESSWAY}/snr5/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_EXPRESSWAY}/snr5/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_EXPRESSWAY}/snr10

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_EXPRESSWAY}/snr10/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_EXPRESSWAY}/snr10/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_EXPRESSWAY}/snr15

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_EXPRESSWAY}/snr15/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_EXPRESSWAY}/snr15/${ID}.mfc039
    rm ${TMPFILE}*
  end
end

mkdir -p ${DIR_OUT_EXPRESSWAY}/snr20

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE "mktemp"
    HCopy -C prefs/myconfig_hcopy ${DIR_IN_EXPRESSWAY}/snr20/${ID}.wav ${TMPFILE}.htk
    dd if=${TMPFILE}.htk bs=1 skip=12 of=${DIR_OUT_EXPRESSWAY}/snr20/${ID}.mfc039
    rm ${TMPFILE}*
  end
end
