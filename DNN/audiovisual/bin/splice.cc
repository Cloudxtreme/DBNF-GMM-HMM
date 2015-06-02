// ���ץ饤���󥰥ץ����
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

// ���ץ��������ؿ�

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

// �ե����뤫�� 1 ���ɤ߹���ؿ�

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

// �ᥤ��ؿ�

int main(int argc,char *argv[]){
  try{

    char **value;

    // �إ�פ�ɽ��

    if(argc==1||
       ArgFrontEnd(argc,argv,"-h",&value)!=-1||
       ArgFrontEnd(argc,argv,"-help",&value)!=-1){
      printf("���ץ饤���󥰥ץ����\n");
      printf("Programed by Shigeki Matsuda (2013/10/9)\n");
      printf("\n");
      printf("Usage: %s [-veclen][-llen][-rlen] < in.dat > out.dat\n",argv[0]);
      printf("  [-veclen] �٥��ȥ�Ĺ    (39)\n");
      printf("    [-llen] ���ե졼���  (5)\n");
      printf("    [-rlen] ���ե졼���  (5)\n");
      exit(0);
    }

    // ���ޥ�ɰ���������

    int veclen=39;
    switch(ArgFrontEnd(argc,argv,"-veclen",&value)){
    case -1:
      break;
    case  1:
      veclen=atoi(*value);
      break;
    default:
      throw (char *)"ERR: �٥��ȥ�Ĺ�����꤬�ְ�äƤ��ޤ�.";
    }

    int llen=5;
    switch(ArgFrontEnd(argc,argv,"-llen",&value)){
    case -1:
      break;
    case  1:
      llen=atoi(*value);
      break;
    default:
      throw (char *)"ERR: ���ե졼��������꤬�ְ�äƤ��ޤ�.";
    }

    int rlen=5;
    switch(ArgFrontEnd(argc,argv,"-rlen",&value)){
    case -1:
      break;
    case  1:
      rlen=atoi(*value);
      break;
    default:
      throw (char *)"ERR: ���ե졼��������꤬�ְ�äƤ��ޤ�.";
    }

    // ��ħ�٥��ȥ��������ɤ߹���

    vector<float *> param;
    while(true){
      float * parvec=new float [veclen];
      int ret=fread(parvec,sizeof(float),veclen,stdin);
      if(ret==0)break;
      if(ret!=veclen)
	throw (char *)"ERR: ��ħ�٥��ȥ������μ��������ְ�äƤ��ޤ�.";
      param.push_back(parvec);
    }

    // ��ħ�٥��ȥ������ν񤭽Ф�

    for(int t=0;t<(int)param.size();t++){

      // ���ץ饤���󥰽���

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

      // ��ħ�٥��ȥ������ν񤭽Ф�

      fwrite(parvec,sizeof(float),veclen*(llen+1+rlen),stdout);

    }

  }catch(char * errmsg){
    fprintf(stderr,"%s\n",errmsg);
    exit(-1);
  }
  exit(0);
}
