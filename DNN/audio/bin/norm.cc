// ʿ��ʬ�����������ץ����
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

// �Х��ȥ���å״ؿ�

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

// �ᥤ��ؿ�

int main(int argc,char *argv[]){
  try{

    char **value;

    // �إ�פ�ɽ��

    if(argc==1||
       ArgFrontEnd(argc,argv,"-h",&value)!=-1||
       ArgFrontEnd(argc,argv,"-help",&value)!=-1){
      printf("ʿ��ʬ�����������ץ����\n");
      printf("Programed by Shigeki Matsuda (2013/10/23)\n");
      printf("\n");
      printf("Usage: %s [-distfile] < in.dat > out.dat\n",argv[0]);
      printf("  [-distfile] ʿ��ʬ���ե�����̾\n");
      exit(0);
    }

    // ���ޥ�ɰ���������

    if(ArgFrontEnd(argc,argv,"-distfile",&value)!=1)
      throw (char *)"ERR: ʿ��ʬ���ե�����̾�����꤬�ְ�äƤ��ޤ�.";
    string distfilename=*value;

    // ʿ��ʬ���ե�������ɤ߹���

    vector<double> mean,deviation;
    {
      FILE * fp=fopen(distfilename.c_str(),"r");
      if(fp==NULL)
	throw (char *)"ERR: ʿ��ʬ���ե�������ɤ߹��ߤ˼��Ԥ��ޤ���.";
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
	  throw (char *)"ERR: ʿ��ʬ���ե�������ɤ߹��ߤ˼��Ԥ��ޤ���.";
	mean.push_back(atof(tmp[0].c_str()));
	deviation.push_back(sqrt(atof(tmp[1].c_str())));
      }
      fclose(fp);
    }

    int veclen=(int)mean.size();

    // ��ħ�٥��ȥ�������������

    while(true){
      float parvec[veclen];
      int ret=fread(parvec,sizeof(float),veclen,stdin);
      if(ret==0)break;
      if(ret!=veclen)
	throw (char *)"ERR: ��ħ�٥��ȥ������μ��������ְ�äƤ��ޤ�.";
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
