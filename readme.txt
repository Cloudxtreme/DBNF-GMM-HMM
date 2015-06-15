[はじめに]
Deep Bottleneck Audio Feature(DBAF)と
Deep Bottleneck Visual Feature(DBVF)の抽出、
マルチストリームGMM-HMMの構築、
それらを用いてJuliusで認識結果を得るために
必要なファイルをまとめたものです。


[内容]
DB_ROOT		:DB_ROOT追加用
DNN		:DNNの学習、特徴抽出用
Matlab		:Matlabファイル
USER_ROOT	:USER_ROOT追加用
work_julius	:Julius用


[DB_ROOT]
CENSREC-1-AVに追加するためのファイルが
まとめられたフォルダです。


[DNN]
DNNの学習からDeep BottleNeck Feature(DBNF)の
抽出までを行うためのフォルダです。
音響情報、画像情報、マルチモーダル情報から
DBAF、DBVF、DBAVFを抽出することができます。


[Matlab]
Matlabを用いてDNNの学習の際に用いるラベルデータを
作成するためのフォルダです。
また、作成されたラベルデータと発話データのフレーム数が
異なるものを検出することもできます。


[USER_ROOT]
USER_ROOTに追加するためのファイルが
まとめられたフォルダです。


[work_julius]
Julius(dictation-kit-v4.3.1.-linux)を用いて
認識を行うためのフォルダです。


[使用方法]
以下に、認識結果を得るまでの手順を簡単に示します。


CENSREC-1-AVに、DB_ROOTフォルダ内のファイルを追加

USER_ROOTフォルダ内のファイルを追加

MFCCを用いて音響モデルを構築

構築した音響モデルを元に、transファイルを作成

Matlabを用いてラベルデータを生成

生成したラベルデータを元にDNNを学習

抽出したDBAF、DBVFを用いてそれぞれ音響モデルを構築

Juliusを用いて認識


各手順の詳細はそれぞれのフォルダ内にあるreadmeを
参照してください。


[最後に]
大変大雑把な説明ですが、以上となります。
不要なファイルも混在していると思います。
何かご不明な点や、行き詰ってしまった場合は
お気軽にご連絡ください。


2015/3/31 Hiroshi Ninomiya
