// 平均分散の計算プログラム
// Programed by Shigeki Matsuda (2013/10/23)
// Copyright (C) 2013 NICT

#include<cstdio>
#include<cstdlib>
#include<cstring>
#include<cmath>

#include<string>
#include<vector>
#include<set>
#include<map>

using namespace std;

// オプション処理関数

static int ArgFrontEnd(int argc,char *argv[],const char *attr,char **value[]){
  int i,n;

  for(i=0;i<argc;i++)if(strcmp(attr,argv[i])==0){
    *value=&argv[++i];
    for(n=0;argc!=i;i++,n++){
      if(argv[i][0]=='-'&&('0'>argv[i][1]||argv[i][1]>'9'))break;
    }
    return(n);
  }

  return(-1);
}

// ファイルから 1 行読み込む関数

string readline(FILE *fp){
  string str;
  while(true){
    char buf[1024];
    if(!fgets(buf,1024,fp))break;
    str+=buf;
    if(buf[strlen(buf)-1]=='\n')break;
  }

  return(str);
}

// バイトスワップ関数

void bswap(void * p,int size){
  int n;
  unsigned char swap;

  for(n=0;n<size/2;n++){
    swap=((unsigned char *)p)[n];
    ((unsigned char *)p)[n]=((unsigned char *)p)[size-n-1];
    ((unsigned char *)p)[size-n-1]=swap;
  }
  
  return;
}

// メイン関数

int main(int argc,char *argv[]){
  try{

    char **value;

    // へルプの表示

    if(ArgFrontEnd(argc,argv,"-h",&value)!=-1||
       ArgFrontEnd(argc,argv,"-help",&value)!=-1){
      printf("平均分散の計算プログラム\n");
      printf("Programed by Shigeki Matsuda (2013/10/23)\n");
      printf("\n");
      printf("Usage: %s [-veclen] < hoge.dat > hoge.dist\n",argv[0]);
      printf("  [-veclen] ベクトル長 (429)\n");
      exit(0);
    }

    // コマンド引数の設定

    int veclen=429;
    switch(ArgFrontEnd(argc,argv,"-veclen",&value)){
    case -1:
      break;
    case  1:
      veclen=atoi(*value);
      break;
    default:
      throw (char *)"ERR: ベクトル長の設定が間違っています.";
    }

    // 平均分散ベクトルの計算

    long num=0;
    double mean[veclen],variance[veclen];
    for(int d=0;d<veclen;d++)mean[d]=variance[d]=0.0;

    for(;;num++){
      float parvec[veclen];
      int ret=fread(parvec,sizeof(float),veclen,stdin);
      if(ret==0)break;
      if(ret!=veclen)
	throw (char *)"ERR: 特徴ベクトル時系列の次元数が間違っています.";
      for(int d=0;d<veclen;d++)bswap(parvec+d,sizeof(float));
      for(int d=0;d<veclen;d++){
	double x=(double)parvec[d];
	mean[d]    +=x;
	variance[d]+=x*x;
      }
    }

    for(int d=0;d<veclen;d++){
      mean[d]=mean[d]/(double)num;
      variance[d]=variance[d]/(double)num-mean[d]*mean[d];
    }

    // 平均分散ベクトルの書き出し

    for(int d=0;d<veclen;d++){
      printf("%+e %e\n",mean[d],variance[d]);
    }

  }catch(char * errmsg){
    fprintf(stderr,"%s\n",errmsg);
    exit(-1);
  }
  exit(0);
}
