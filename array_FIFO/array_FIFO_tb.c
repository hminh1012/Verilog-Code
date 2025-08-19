#include "array_FIFO.h"



int main(){
din_t d_i[4];
dout_t d_o[4];
didx_t idx[4];
int i, retval=0;
FILE *fp;

for(i=0;i<4;i++){
d_i[i] = i+10;
idx[i] = i;
}

array_FIFO(d_o,d_i,idx);

fp=fopen("result.dat","w");
fprintf(fp,"Din Dout\n");

for(i=0;i<4;i++){
	fprintf(fp,"%d %d\n", d_i[i],d_o[i]);
}
fclose(fp);


retval = system("diff --brief -w result.da result.goldn.dat");
if(retval != 0){
printf("Test failed\n");
retval = 1;
}else{
printf("Test passed\n");
}
return retval;
}
