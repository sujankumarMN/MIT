#include<stdlib.h>
#include<stdio.h>
#include<assert.h>
#include "header.h"
int main()
{
	Graph *graph;
	graph=graph_init();
	assert(graph->count_graph==0);
	assert(insert_vertices(graph,"graph.txt"));
}