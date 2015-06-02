// 平均分散の正規化プログラム
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

    if(argc==1||
       ArgFrontEnd(argc,argv,"-h",&value)!=-1||
       ArgFrontEnd(argc,argv,"-help",&value)!=-1){
      printf("平均分散の正規化プログラム\n");
      printf("Programed by Shigeki Matsuda (2013/10/23)\n");
      printf("\n");
      printf("Usage: %s [-distfile] < in.dat > out.dat\n",argv[0]);
      printf("  [-distfile] 平均分散ファイル名\n");
      exit(0);
    }

    // コマンド引数の設定

    if(ArgFrontEnd(argc,argv,"-distfile",&value)!=1)
      throw (char *)"ERR: 平均分散ファイル名の設定が間違っています.";
    string distfilename=*value;

    // 平均分散ファイルの読み込み

    vector<double> mean,deviation;
    {
      FILE * fp=fopen(distfilename.c_str(),"r");
      if(fp==NULL)
	throw (char *)"ERR: 平均分散ファイルの読み込みに失敗しました.";
      while(true){
	string str=readline(fp);
	if(feof(fp)!=0)break;
	str.erase(str.size()-1);
	char buf[str.size()+1];
	strcpy(buf,str.c_str());
	vector<string> tmp;
	for(char * token=strtok(buf," \t\r\n");token;
	    token=strtok(NULL," \t\r\n"))tmp.push_back(token);
	if(tmp.size()!=2)
	  throw (char *)"ERR: 平均分散ファイルの読み込みに失敗しました.";
	mean.push_back(atof(tmp[0].c_str()));
	deviation.push_back(sqrt(atof(tmp[1].c_str())));
      }
      fclose(fp);
    }

    int veclen=(int)mean.size();

    // 特徴ベクトル時系列の正規化

    while(true){
      float parvec[veclen];
      int ret=fread(parvec,sizeof(float),veclen,stdin);
      if(ret==0)break;
      if(ret!=veclen)
	throw (char *)"ERR: 特徴ベクトル時系列の次元数が間違っています.";
      for(int d=0;d<veclen;d++)bswap(parvec+d,sizeof(float));
      for(int d=0;d<veclen;d++)parvec[d]=(parvec[d]-mean[d])/deviation[d];
      for(int d=0;d<veclen;d++)bswap(parvec+d,sizeof(float));
      fwrite(parvec,sizeof(float),veclen,stdout);
    }

  }catch(char * errmsg){
    fprintf(stderr,"%s\n",errmsg);
    exit(-1);
  }
  exit(0);
}
