// 出力ラベルファイルの作成プログラム
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
      printf("出力ラベルファイルの作成プログラム\n");
      printf("Programed by Shigeki Matsuda (2013/10/23)\n");
      printf("\n");
      printf("Usage: %s [-mapfile] < hoge.lab > hoge.ylab\n",argv[0]);
      printf("  [-mapfile] 音素マップファイル名\n");
      exit(0);
    }

    // コマンド引数の設定

    if(ArgFrontEnd(argc,argv,"-mapfile",&value)!=1)
      throw (char *)"ERR: 1音素マップファイル名の設定が間違っています.";
    string mapfilename=*value;

    // 音素マップファイルの読み込み

    map<string,unsigned short> labmap;
    {
      FILE * fp=fopen(mapfilename.c_str(),"r");
      if(fp==NULL)
	throw (char *)"ERR: 音素マップファイルの読み込みに失敗しました.";
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
	  throw (char *)"ERR: 2音素マップファイルの読み込みに失敗しました.";
	pair<string,int> ii(tmp[1],(unsigned short)atoi(tmp[0].c_str()));
	labmap.insert(ii);
      }
      fclose(fp);
    }

    // 出力ラベルファイルの作成

    while(true){
      string str=readline(stdin);
      if(feof(stdin)!=0)break;
      str.erase(str.size()-1);
      char buf[str.size()+1];
      strcpy(buf,str.c_str());
      vector<string> tmp;
      for(char * token=strtok(buf," \t\r\n");token;
	  token=strtok(NULL," \t\r\n"))tmp.push_back(token);
      if(tmp.size()!=3)
	throw (char *)"ERR: 3.";
      int    bn =atoi(tmp[0].c_str());
      int    en =atoi(tmp[1].c_str());
      string lab=tmp[2];
      map<string,unsigned short>::iterator pp=labmap.find(lab);
      unsigned short id=pp->second;
      bswap(&id,sizeof(unsigned short));
      if(pp==labmap.end())
	throw (char *)"ERR: 4.";
      for(int t=bn;t<en;t++)fwrite(&id,sizeof(unsigned short),1,stdout);
    }

  }catch(char * errmsg){
    fprintf(stderr,"%s\n",errmsg);
    exit(-1);
  }
  exit(0);
}
