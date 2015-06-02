#! /bin/tcsh -f
# Written by Shigeki Matsuda (2013/10/23)
# Copyright (C) 2013 NICT
#
# 2013/12/21 Modified by Tomoki Hayashi
#   -o—Íæ‚Æ“ü—Íæ‚ðŽw’è‚Å‚«‚é‚æ‚¤‚ÉC³ 

setenv DIR_IN_CLEAN "mfcpca069/clean"
setenv DIR_OUT_CLEAN "mfcpca759/clean"
setenv DIR_IN_AUDIO "mfcpca069/audio"
setenv DIR_OUT_AUDIO "mfcpca759/audio"
setenv DIR_IN_AUDIO_CITYROAD "mfcpca069/audio-cityroad"
setenv DIR_OUT_AUDIO_CITYROAD "mfcpca759/audio-cityroad"
setenv DIR_IN_AUDIO_EXPRESSWAY "mfcpca069/audio-expressway"
setenv DIR_OUT_AUDIO_EXPRESSWAY "mfcpca759/audio-expressway"
setenv DIR_IN_CITYROAD "mfcpca069/cityroad"
setenv DIR_OUT_CITYROAD "mfcpca759/cityroad"
setenv DIR_IN_EXPRESSWAY "mfcpca069/expressway"
setenv DIR_OUT_EXPRESSWAY "mfcpca759/expressway"

mkdir -p ${DIR_OUT_CLEAN}

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_CLEAN}/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_CLEAN}/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_AUDIO}/snr-5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO}/snr-5/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_AUDIO}/snr-5/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_AUDIO}/snr0

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO}/snr0/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_AUDIO}/snr0/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_AUDIO}/snr5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO}/snr5/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_AUDIO}/snr5/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_AUDIO}/snr10

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO}/snr10/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_AUDIO}/snr10/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_AUDIO}/snr15

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO}/snr15/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_AUDIO}/snr15/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_AUDIO}/snr20

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO}/snr20/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_AUDIO}/snr20/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_AUDIO_CITYROAD}/snr-5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO_CITYROAD}/snr-5/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_AUDIO_CITYROAD}/snr-5/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_AUDIO_CITYROAD}/snr0

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO_CITYROAD}/snr0/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_AUDIO_CITYROAD}/snr0/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_AUDIO_CITYROAD}/snr5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO_CITYROAD}/snr5/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_AUDIO_CITYROAD}/snr5/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_AUDIO_CITYROAD}/snr10

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO_CITYROAD}/snr10/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_AUDIO_CITYROAD}/snr10/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_AUDIO_CITYROAD}/snr15

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO_CITYROAD}/snr15/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_AUDIO_CITYROAD}/snr15/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_AUDIO_CITYROAD}/snr20

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO_CITYROAD}/snr20/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_AUDIO_CITYROAD}/snr20/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_AUDIO_EXPRESSWAY}/snr-5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO_EXPRESSWAY}/snr-5/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_AUDIO_EXPRESSWAY}/snr-5/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_AUDIO_EXPRESSWAY}/snr0

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO_EXPRESSWAY}/snr0/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_AUDIO_EXPRESSWAY}/snr0/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_AUDIO_EXPRESSWAY}/snr5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO_EXPRESSWAY}/snr5/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_AUDIO_EXPRESSWAY}/snr5/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_AUDIO_EXPRESSWAY}/snr10

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO_EXPRESSWAY}/snr10/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_AUDIO_EXPRESSWAY}/snr10/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_AUDIO_EXPRESSWAY}/snr15

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO_EXPRESSWAY}/snr15/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_AUDIO_EXPRESSWAY}/snr15/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_AUDIO_EXPRESSWAY}/snr20

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_AUDIO_EXPRESSWAY}/snr20/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_AUDIO_EXPRESSWAY}/snr20/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_CITYROAD}/snr-5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_CITYROAD}/snr-5/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_CITYROAD}/snr-5/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_CITYROAD}/snr0

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_CITYROAD}/snr0/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_CITYROAD}/snr0/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_CITYROAD}/snr5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_CITYROAD}/snr5/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_CITYROAD}/snr5/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_CITYROAD}/snr10

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_CITYROAD}/snr10/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_CITYROAD}/snr10/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_CITYROAD}/snr15

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_CITYROAD}/snr15/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_CITYROAD}/snr15/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_CITYROAD}/snr20

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_CITYROAD}/snr20/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_CITYROAD}/snr20/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_EXPRESSWAY}/snr-5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_EXPRESSWAY}/snr-5/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_EXPRESSWAY}/snr-5/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_EXPRESSWAY}/snr0

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_EXPRESSWAY}/snr0/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_EXPRESSWAY}/snr0/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_EXPRESSWAY}/snr5

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_EXPRESSWAY}/snr5/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_EXPRESSWAY}/snr5/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_EXPRESSWAY}/snr10

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_EXPRESSWAY}/snr10/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_EXPRESSWAY}/snr10/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_EXPRESSWAY}/snr15

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_EXPRESSWAY}/snr15/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_EXPRESSWAY}/snr15/${ID}.mfcpca759
  end
end

mkdir -p ${DIR_OUT_EXPRESSWAY}/snr20

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN_EXPRESSWAY}/snr20/${ID}.mfcpca069 \
      | ./bin/splice -veclen 69 \
                     -llen   5 \
                     -rlen   5 \
      > ${DIR_OUT_EXPRESSWAY}/snr20/${ID}.mfcpca759
  end
end
