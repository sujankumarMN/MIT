#include "header.h"
#include<stdlib.h>
#include<assert.h>
#include<stdio.h>
#include<string.h>

List * init()
{
	List *my_list;
	my_list=(List *)malloc(sizeof(my_list));
	if(my_list==NULL) return NULL;
	my_list->count=0;
	my_list->head=my_list->tail=NULL;
	return my_list;
}

Node * getnode(Squad player)
{
	Node *newnode;
	newnode=(Node *)malloc(sizeof(Node));
	if(newnode==NULL) return NULL;
	newnode->ptr==NULL;
	newnode->squad=(Squad *)malloc(sizeof(Squad));
	strcpy(newnode->squad->name,player.name);
	strcpy(newnode->squad->position,player.position);
	newnode->squad->sub=player.sub;
	return newnode;
}

int insert_players(List *my_list,Squad player)
{
	Node *my_node;
	my_node= getnode(player);

	if (my_list->count==0)
	{
		
		my_list->count++;
		my_list->head=my_list->tail=my_node;
		return INSERTED;
		
	}
	else
	{
		my_list->count++;
		my_list->tail->ptr=my_node;
		my_list->tail=my_node;
		return INSERTED;
	}
}
void substitute(List *my_list,char name1[],char name2[])
	{
		

		Squad *temp1,*temp2;
		temp1=(Squad *)malloc(sizeof(Squad));
		temp2=(Squad *)malloc(sizeof(Squad));
		Node *temp;
		printf("%s\n",name1);
		printf("%s\n",name2);
		for(temp=my_list->head;temp!=NULL;temp=temp->ptr)
		{
			if(!strcmp(name1,temp->squad->name))
				{
					
					temp1=temp->squad;
					
				}
			if(!strcmp(name2,temp->squad->name))
				{//for(i=0;i<16;i++)
	
					
					temp2=temp->squad;
					
				}
		}
		if(!strcmp(temp1->position,temp2->position))
		{
			temp1->sub=1;
			temp2->sub=0;
			

		}
		else
		{
			printf("ARE YOU DRUNK?!!!");
		}
	}





