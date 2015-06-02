// スプライシングプログラム
// Programed by Shigeki Matsuda (2013/10/9)
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

// メイン関数

int main(int argc,char *argv[]){
  try{

    char **value;

    // へルプの表示

    if(argc==1||
       ArgFrontEnd(argc,argv,"-h",&value)!=-1||
       ArgFrontEnd(argc,argv,"-help",&value)!=-1){
      printf("スプライシングプログラム\n");
      printf("Programed by Shigeki Matsuda (2013/10/9)\n");
      printf("\n");
      printf("Usage: %s [-veclen][-llen][-rlen] < in.dat > out.dat\n",argv[0]);
      printf("  [-veclen] ベクトル長    (39)\n");
      printf("    [-llen] 左フレーム数  (5)\n");
      printf("    [-rlen] 右フレーム数  (5)\n");
      exit(0);
    }

    // コマンド引数の設定

    int veclen=39;
    switch(ArgFrontEnd(argc,argv,"-veclen",&value)){
    case -1:
      break;
    case  1:
      veclen=atoi(*value);
      break;
    default:
      throw (char *)"ERR: ベクトル長の設定が間違っています.";
    }

    int llen=5;
    switch(ArgFrontEnd(argc,argv,"-llen",&value)){
    case -1:
      break;
    case  1:
      llen=atoi(*value);
      break;
    default:
      throw (char *)"ERR: 左フレーム数の設定が間違っています.";
    }

    int rlen=5;
    switch(ArgFrontEnd(argc,argv,"-rlen",&value)){
    case -1:
      break;
    case  1:
      rlen=atoi(*value);
      break;
    default:
      throw (char *)"ERR: 右フレーム数の設定が間違っています.";
    }

    // 特徴ベクトル時系列の読み込み

    vector<float *> param;
    while(true){
      float * parvec=new float [veclen];
      int ret=fread(parvec,sizeof(float),veclen,stdin);
      if(ret==0)break;
      if(ret!=veclen)
	throw (char *)"ERR: 特徴ベクトル時系列の次元数が間違っています.";
      param.push_back(parvec);
    }

    // 特徴ベクトル時系列の書き出し

    for(int t=0;t<(int)param.size();t++){

      // スプライシング処理

      float parvec[veclen*(llen+1+rlen)];
      for(int w=0,u=t-llen;u<=t+rlen;w++,u++){
	if(u<0){
	  memcpy(parvec+veclen*w,param[0],
		 sizeof(float)*veclen);
	}else if((int)param.size()<=u){
	  memcpy(parvec+veclen*w,param[param.size()-1],
		 sizeof(float)*veclen);
	}else{
	  memcpy(parvec+veclen*w,param[u],
		 sizeof(float)*veclen);
	}
      }

      // 特徴ベクトル時系列の書き出し

      fwrite(parvec,sizeof(float),veclen*(llen+1+rlen),stdout);

    }

  }catch(char * errmsg){
    fprintf(stderr,"%s\n",errmsg);
    exit(-1);
  }
  exit(0);
}
