#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#include<string.h>

int main()
{
	int adj[3][3],weight;
	char in1[3],in2[3];
	int i,j, num_vertices=0;
	FILE *fp;
	char ch;

	for(i=0;i<3;i++)
	{
			for(j=0;j<3;j++)
				adj[i][j]=0;
	}

	fp=fopen("graph.txt","r");
	
	while(!feof(fp))
	{
		fscanf(fp,"%s %s %d",in1,in2,&weight);
		
			adj[atoi(&in1[1])-1][atoi(&in2[1])-1]=weight;
			adj[atoi(&in1[1])-1][atoi(&in2[1])-1]=weight;
	}
	

	for(i=0;i<3;i++)
	{
			for(j=0;j<3;j++)
				printf("%d ",adj[i][j]);
			printf("\n");
	}
}































	/*for(i=0;i<3;i++)
	{
			for(j=0;j<3;j++)
				printf("%d ",adj[i][j]);
	}*/


		/*if(!strcmp(in1,"v1"))
			i=0;
		if(!strcmp(in1,"v2"))
			i=1;
		if(!strcmp(in1,"v3"))
			i=2;

		if(!strcmp(in2,"v1"))
			adj[i][0]=1;
		if(!strcmp(in2,"v2"))
			adj[i][1]=1;
		if(!strcmp(in2,"v3"))
			adj[i][2]=1;

		if(!strcmp(in3,"v1"))
			adj[i][0]=1;
		if(!strcmp(in3,"v2"))
			adj[i][1]=1;
		if(!strcmp(in3,"v3"))
			adj[i][2]=1;*/
	//}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    