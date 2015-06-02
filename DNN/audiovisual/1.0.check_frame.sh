#! /bin/tcsh -f
# Written by Shigeki Matsuda (2013/10/23)
# Copyright (C) 2013 NICT
#
# 2013/12/21 Modified by Tomoki Hayashi
#   -o—Íæ‚Æ“ü—Íæ‚ðŽw’è‚Å‚«‚é‚æ‚¤‚ÉC³ 

setenv DIR_IN_CLEAN "~/work/mfcpca_infrared/clean"
setenv DIR_OUT_CLEAN "~/work/mfcpca069/clean"
setenv DIR_IN_AUDIO "~/work/mfcpca_infrared/audio"
setenv DIR_OUT_AUDIO "~/work/mfcpca069/audio"
setenv DIR_IN_CITYROAD "~/work/mfcpca_infrared/cityroad"
setenv DIR_OUT_CITYROAD "~/work/mfcpca069/cityroad"
setenv DIR_IN_EXPRESSWAY "~/work/mfcpca_infrared/expressway"
setenv DIR_OUT_EXPRESSWAY "~/work/mfcpca069/expressway"

mkdir -p ${DIR_OUT_CLEAN}

foreach SET (  train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE `mktemp`
    cp ${DIR_IN_CLEAN}/${ID}.mfcpca ${ID}.htk
    HList -o -h ${ID}.htk > ${DIR_OUT_CLEAN}/${ID}.txt
    rm ${ID}*
  end
end

mkdir -p ${DIR_OUT_AUDIO}/snr-5

foreach SET (  train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE `mktemp`
    cp ${DIR_IN_AUDIO}/snr-5/${ID}.mfcpca ${ID}.htk
    HList -o -h ${ID}.htk > ${DIR_OUT_AUDIO}/snr-5/${ID}.txt
    rm ${ID}*
  end
end

mkdir -p ${DIR_OUT_AUDIO}/snr0

foreach SET (  train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE `mktemp`
    cp ${DIR_IN_AUDIO}/snr0/${ID}.mfcpca ${ID}.htk
    HList -o -h ${ID}.htk > ${DIR_OUT_AUDIO}/snr0/${ID}.txt
    rm ${ID}*
  end
end

mkdir -p ${DIR_OUT_AUDIO}/snr5

foreach SET (  train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE `mktemp`
    cp ${DIR_IN_AUDIO}/snr5/${ID}.mfcpca ${ID}.htk
    HList -o -h ${ID}.htk > ${DIR_OUT_AUDIO}/snr5/${ID}.txt
    rm ${ID}*
  end
end

mkdir -p ${DIR_OUT_AUDIO}/snr10

foreach SET (  train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE `mktemp`
    cp ${DIR_IN_AUDIO}/snr10/${ID}.mfcpca ${ID}.htk
    HList -o -h ${ID}.htk > ${DIR_OUT_AUDIO}/snr10/${ID}.txt
    rm ${ID}*
  end
end

mkdir -p ${DIR_OUT_AUDIO}/snr15

foreach SET (  train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE `mktemp`
    cp ${DIR_IN_AUDIO}/snr15/${ID}.mfcpca ${ID}.htk
    HList -o -h ${ID}.htk > ${DIR_OUT_AUDIO}/snr15/${ID}.txt
    rm ${ID}*
  end
end

mkdir -p ${DIR_OUT_AUDIO}/snr20

foreach SET (  train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE `mktemp`
    cp ${DIR_IN_AUDIO}/snr20/${ID}.mfcpca ${ID}.htk
    HList -o -h ${ID}.htk > ${DIR_OUT_AUDIO}/snr20/${ID}.txt
    rm ${ID}*
  end
end

mkdir -p ${DIR_OUT_CITYROAD}/snr-5

foreach SET (  train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE `mktemp`
    cp ${DIR_IN_CITYROAD}/snr-5/${ID}.mfcpca ${ID}.htk
    HList -o -h ${ID}.htk > ${DIR_OUT_CITYROAD}/snr-5/${ID}.txt
    rm ${ID}*
  end
end

mkdir -p ${DIR_OUT_CITYROAD}/snr0

foreach SET (  train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE `mktemp`
    cp ${DIR_IN_CITYROAD}/snr0/${ID}.mfcpca ${ID}.htk
    HList -o -h ${ID}.htk > ${DIR_OUT_CITYROAD}/snr0/${ID}.txt
    rm ${ID}*
  end
end

mkdir -p ${DIR_OUT_CITYROAD}/snr5

foreach SET (  train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE `mktemp`
    cp ${DIR_IN_CITYROAD}/snr5/${ID}.mfcpca ${ID}.htk
    HList -o -h ${ID}.htk > ${DIR_OUT_CITYROAD}/snr5/${ID}.txt
    rm ${ID}*
  end
end

mkdir -p ${DIR_OUT_CITYROAD}/snr10

foreach SET (  train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE `mktemp`
    cp ${DIR_IN_CITYROAD}/snr10/${ID}.mfcpca ${ID}.htk
    HList -o -h ${ID}.htk > ${DIR_OUT_CITYROAD}/snr10/${ID}.txt
    rm ${ID}*
  end
end

mkdir -p ${DIR_OUT_CITYROAD}/snr15

foreach SET (  train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE `mktemp`
    cp ${DIR_IN_CITYROAD}/snr15/${ID}.mfcpca ${ID}.htk
    HList -o -h ${ID}.htk > ${DIR_OUT_CITYROAD}/snr15/${ID}.txt
    rm ${ID}*
  end
end

mkdir -p ${DIR_OUT_CITYROAD}/snr20

foreach SET (  train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE `mktemp`
    cp ${DIR_IN_CITYROAD}/snr20/${ID}.mfcpca ${ID}.htk
    HList -o -h ${ID}.htk > ${DIR_OUT_CITYROAD}/snr20/${ID}.txt
    rm ${ID}*
  end
end

mkdir -p ${DIR_OUT_EXPRESSWAY}/snr-5

foreach SET (  train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE `mktemp`
    cp ${DIR_IN_EXPRESSWAY}/snr-5/${ID}.mfcpca ${ID}.htk
    HList -o -h ${ID}.htk > ${DIR_OUT_EXPRESSWAY}/snr-5/${ID}.txt
    rm ${ID}*
  end
end

mkdir -p ${DIR_OUT_EXPRESSWAY}/snr0

foreach SET (  train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE `mktemp`
    cp ${DIR_IN_EXPRESSWAY}/snr0/${ID}.mfcpca ${ID}.htk
    HList -o -h ${ID}.htk > ${DIR_OUT_EXPRESSWAY}/snr0/${ID}.txt
    rm ${ID}*
  end
end

mkdir -p ${DIR_OUT_EXPRESSWAY}/snr5

foreach SET (  train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE `mktemp`
    cp ${DIR_IN_EXPRESSWAY}/snr5/${ID}.mfcpca ${ID}.htk
    HList -o -h ${ID}.htk > ${DIR_OUT_EXPRESSWAY}/snr5/${ID}.txt
    rm ${ID}*
  end
end

mkdir -p ${DIR_OUT_EXPRESSWAY}/snr10

foreach SET (  train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE `mktemp`
    cp ${DIR_IN_EXPRESSWAY}/snr10/${ID}.mfcpca ${ID}.htk
    HList -o -h ${ID}.htk > ${DIR_OUT_EXPRESSWAY}/snr10/${ID}.txt
    rm ${ID}*
  end
end

mkdir -p ${DIR_OUT_EXPRESSWAY}/snr15

foreach SET (  train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE `mktemp`
    cp ${DIR_IN_EXPRESSWAY}/snr15/${ID}.mfcpca ${ID}.htk
    HList -o -h ${ID}.htk > ${DIR_OUT_EXPRESSWAY}/snr15/${ID}.txt
    rm ${ID}*
  end
end

mkdir -p ${DIR_OUT_EXPRESSWAY}/snr20

foreach SET (  train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    setenv TMPFILE `mktemp`
    cp ${DIR_IN_EXPRESSWAY}/snr20/${ID}.mfcpca ${ID}.htk
    HList -o -h ${ID}.htk > ${DIR_OUT_EXPRESSWAY}/snr20/${ID}.txt
    rm ${ID}*
  end
end
