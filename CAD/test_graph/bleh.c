#include<stdio.h>
#include<string.h>
#include<stdlib.h>

int main()
{
	/* char *asdf="v1";
	 int i=atoi(asdf);
	 printf("%d\n",i );
	*/
	int a[10][10],i,j;

	for(i=0;i<3;i++)
	{
			for(j=0;j<3;j++)
				printf("%d ",a[i][j]);
			printf("\n");
	}

}