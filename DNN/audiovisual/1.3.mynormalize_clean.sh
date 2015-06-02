#! /bin/tcsh -f
# Written by Shigeki Matsuda (2013/10/23)
# Copyright (C) 2013 NICT
#
# 2013/12/21 Modified by Tomoki Hayashi
#   -�����������������Ǥ���褦�˽��� 
#   -ʿ��ʬ���٥��ȥ�ե������̿̾�Ǥ���褦�˽���
#   -ʿ��ʬ����׻����뤫��ON��OFF�Ǥ���褦�˽���


setenv DIR_IN "mfcpca759/clean"
setenv DIR_OUT "mfcpca759_norm/clean"
setenv DIST_DIR "prefs/distfile"
setenv DIST_NAME distfile_mfcpca759_clean
setenv SWITCH ON

# ʿ��ʬ���٥��ȥ�η׻�

if ("${SWITCH}" == "ON") then
      setenv TMPFILE `mktemp`

      foreach ID ( `cat prefs/myids.train` )
        echo ${DIR_IN}/${ID}.mfcpca759 >> ${TMPFILE}.flist
      end

      cat `cat ${TMPFILE}.flist` \
        | ./bin/dist -veclen 759 \
        > ${DIST_DIR}/${DIST_NAME}

      rm ${TMPFILE}*
endif

# ʿ��ʬ����������

mkdir -p ${DIR_OUT}

foreach SET ( test train valid )
  foreach ID ( `cat prefs/myids.${SET}` )
    echo ${ID}
    cat ${DIR_IN}/${ID}.mfcpca759 \
      | ./bin/norm -distfile ${DIST_DIR}/${DIST_NAME} \
      > ${DIR_OUT}/clean_${ID}.mfcpca759_norm
  end
end
