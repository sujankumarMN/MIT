#include "header.h"
#include<stdlib.h>
#include<assert.h>
#include<stdio.h>
#include<string.h>

int main()
{
	List *list;
	//Node *node;
	Squad player;
	list=init();
	assert(list!=NULL);

	//node=(Node *)malloc(sizeof(Node));
	//player=(Squad *)malloc(sizeof(Squad));

	strcpy(player.name,"L_martinez");
	strcpy(player.position,"F");
	player.sub=0;
	assert(insert_players(list,player)==INSERTED);
	
	strcpy(player.name,"celso");
	strcpy(player.position,"F");
	player.sub=0;
	assert(insert_players(list,player)==INSERTED);

	strcpy(player.name,"messi");
	strcpy(player.position,"F");
	player.sub=0;
	assert(insert_players(list,player)==INSERTED);

	strcpy(player.name,"di_maria");
	strcpy(player.position,"MF");
	player.sub=0;
	assert(insert_players(list,player)==INSERTED);

	strcpy(player.name,"Rodriguez");
	strcpy(player.position,"MF");
	player.sub=0;
	assert(insert_players(list,player)==INSERTED);

	strcpy(player.name,"De_paul");
	strcpy(player.position,"MF");
	player.sub=0;
	assert(insert_players(list,player)==INSERTED);

	strcpy(player.name,"Taglifico");
	strcpy(player.position,"D");
	player.sub=0;
	assert(insert_players(list,player)==INSERTED);

	strcpy(player.name,"otamendi");
	strcpy(player.position,"D");
	player.sub=0;
	assert(insert_players(list,player)==INSERTED);

	strcpy(player.name,"Romero");
	strcpy(player.position,"D");
	player.sub=0;
	assert(insert_players(list,player)==INSERTED);

	strcpy(player.name,"Molina");
	strcpy(player.position,"D");
	player.sub=0;
	assert(insert_players(list,player)==INSERTED);

	strcpy(player.name,"D_martinez");
	strcpy(player.position,"GK");
	player.sub=0;
	assert(insert_players(list,player)==INSERTED);

	strcpy(player.name,"Rulli");
	strcpy(player.position,"GK");
	player.sub=1;
	assert(insert_players(list,player)==INSERTED);

	strcpy(player.name,"Allister");
	strcpy(player.position,"MF");
	player.sub=1;
	assert(insert_players(list,player)==INSERTED);

	strcpy(player.name,"Pezzella");
	strcpy(player.position,"D");
	player.sub=1;
	assert(insert_players(list,player)==INSERTED);

	strcpy(player.name,"Gomez");
	strcpy(player.position,"MF");
	player.sub=1;
	assert(insert_players(list,player)==INSERTED);

	strcpy(player.name,"Correa");
	strcpy(player.position,"F");
	player.sub=1;
	assert(insert_players(list,player)==INSERTED);
	Node  *temp1;
	//temp1=list->head;
	for(temp1=list->head;temp1!=NULL;temp1=temp1->ptr)
	{
		if(temp1->squad->sub!=1)
			printf("\n%s --> %s\n",temp1->squad->name,temp1->squad->position );
	}

	char name1[20]="Rodriguez";
	char name2[20]="Pezzella";
	
	substitute(list,name1,name2);
	int i;
	for(temp1=list->head,i=0;temp1!=NULL,i<16;temp1=temp1->ptr,i++)
	{
		if(temp1->squad->sub!=1)
			printf("\n%d.%s --> %s\n",i+1,temp1->squad->name,temp1->squad->position );
	}

	//substitute(list,name1,name2);
}