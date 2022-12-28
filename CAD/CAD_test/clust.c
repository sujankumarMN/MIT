# include <stdio.h>
# include <stdlib.h>
# include "clust.h"



Graph * graph_init()  
// Creating the graphs (clusters)
{

	Graph *my_graph;
	my_graph = (Graph *)malloc(sizeof(Graph));

	if(my_graph==NULL) 

  return NULL;
	my_graph->count_graph=0;
	my_graph->graph_tail= NULL;
	my_graph->graph_head=NULL;


  return my_graph;

}



List * get_list(int v)
//for creating the list having vertex number and  
//Pointer which having the address  

{
	List *my_list;
	my_list=(List *)malloc(sizeof(List));

	if(my_list==NULL) 
return NULL;

	my_list->ptr==NULL;
	my_list->vertice_no=v;
	my_list->head=my_list->tail=NULL;

	return my_list;
}



// Inserting the Vertices into the graph

int insert_vertice(Graph *my_graph, char doc[])
{
	FILE *fp;
	List *my_list; 
	int vertices,weight,i,j;
	char in1[3],in2[3],in[3];

	fp=fopen(graph.txt,"r");//reading the graph
	fscanf(fp,"%d",&vertices);


	List *my_list;

	fscanf(fp,"%s %s %s",in1,in2,in2);
	my_list=search(my_graph,in1);
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
			
			}

	}

	fclose(fp);


List * search(Graph *my_graph,int v)
//For Searching the Nodes

    {
	    List *temp;       // Creating  the temp 
	    for(temp=my_graph->graph_head ;temp!=NULL;temp=temp->ptr)
	   	                  // For Traversiing the Graph
	  
	  {
		  if(temp->vertice_no==v)

		  return temp;
	  else
		   
		   return NULL;
}

}
/*while(!feof(fp))
	{
		fscanf(fp,"%s %s %d",in1,in2,&weight);
		
			my_list=get_list(in1);

			if(my_graph->count_graph == 0)
			{
				my_graph->count_graph++;	
				my_graph->graph_tail=my_graph->graph_head=my_list;
				
			}
			else
			{
				my_graph->count_graph++;

				my_graph->graph_tail->ptr=my_list;
				my_graph->graph_tail=my_list;
		
			}
	}
*/



List * display(Graph *my_graph int_v)
{

// 1st calling the search graph 
// if its found then create a cluster for it


}






	







