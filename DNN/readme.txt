DNN


[はじめに]
DNNの学習からDBNFの抽出までを行うための
ツールキットです。


[内容]
readme		:このファイルです。
audio		:DBAF抽出用
audiovisual	:DBAVF抽出用
visual		:DBVF抽出用


[使用方法]
代表例として、DBAF抽出過程を簡単に説明します。

事前準備
label、id、mapfileを用意
label	:正解ラベル
id	:発話ファイルの名前
mapfile	:出力層の各ノードとHMM状態の対応
my*が実例となりますので参考にしてください。

1.1.myhcopy.sh
発話データからMFCC_E_D_Aを抽出し、DNNにかけるために
ヘッダ部分をスキップさせています。

1.2.mysplice.sh
前後5フレーム連結します。

1.3.mynormalize_*.sh
平均0、分散1に正規化します。

2.1.myxdat*.sh
学習データをまとめます。

2.2.myylab*.sh
教師データを生成します。

3.1.mypretrain_*.sh
pre-trainingを行います。

4.1.mybackprop_*.sh
backpropagationを行います。

5.1.myoutput_*.sh
DBAFを抽出します。

myalllearn*.sh
上記のスクリプトをまとめて実行します。


[補足]
1.0.check_frame.sh
発話データのフレーム数を確認します。

1.1.mybinary.sh
ヘッダ部分のスキップのみを行います。

2015/3/31 Hiroshi Ninomiya
