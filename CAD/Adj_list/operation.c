#include<stdlib.h>
#include<stdio.h>
#include "header.h"

Graph * graph_init()
{
	Graph *my_graph;
	my_graph=(Graph *)malloc(sizeof(Graph));
	if(my_graph==NULL) return NULL;
	my_graph->count_graph=0;
	my_graph->graph_tail=my_graph->graph_head=NULL;
	return my_graph;

}

List * get_list(int v)
{
	List *newlist;
	newlist=(List *)malloc(sizeof(List));
	if(newlist==NULL) return NULL;
	newlist->ptr==NULL;
	newlist->vertice_no=v;
	newlist->head=newlist->tail=NULL;
	return newlist;
}


List * search(Graph *my_graph,int v)
{
	List *temp;
	for(temp=my_graph->graph_head;temp!=NULL;temp=temp->ptr)
	{
		if(temp->vertice_no==v)
		return temp;
		else
			return NULL;
	}
	

}
int insert_vertice(Graph *my_graph, char doc[])
{
	FILE *fp;
	List *my_list; 
	int vertices,weight,i,j;
	char in1[3],in2[3],in[3];

	fp=fopen(doc,"r");
	fscanf(fp,"%d",&vertices);

	//my_array->vertices=vertices;
	List *my_list;
	//my_list=get_list
	fscanf(fp,"%s %s %s",in1,in2,in2);
	my_list=search(my_graph,in1)
	if(my_list == NULL)
	{
		if(my_graph->count_graph == 0)
			{
				my_graph->count_graph++;	
				my_graph->graph_tail=my_graph->graph_head=my_list;
				//return INSERTED;
			}
			else
			{
				my_graph->count_graph++;	
				my_graph->graph_tail->ptr=my_list;
				my_graph->graph_tail=my_list;
				//return INSERTED;
			}

	}

	while(!feof(fp))
	{
		fscanf(fp,"%s %s %d",in1,in2,&weight);
		
			my_list=get_list(in1);

			if(my_graph->count_graph == 0)
			{
				my_graph->count_graph++;	
				my_graph->graph_tail=my_graph->graph_head=my_list;
				//return INSERTED;
			}
			else
			{
				my_graph->count_graph++;	
				my_graph->graph_tail->ptr=my_list;
				my_graph->graph_tail=my_list;
				//return INSERTED;
			}

			
	}
	fclose(fp);
	return INSERTED;

	
}
