#include<stdio.h>
#include<stdlib.h>
#include "header.h"

Kantara * init()
{
	Kantara *kan;
	kan=(Kantara *)malloc(sizeof(Kantara));
	if(NULL==kan) return NULL;
	kan->c_size=0;
	kan->t_size=TOTAL_SCREENS;
	kan->screen=(Screen *)malloc(sizeof(Screen)*TOTAL_SCREENS);

	//screen1 initialisation
	kan->screen->num=1;
	kan->screen->seat=0;
	kan->screen->vip=30;
	kan->screen->gold=80;
	kan->screen->silver=40;
	kan->screen->total=150;
	kan->screen->status=AVAILABLE;

	//screen 2 initialisation
	(kan->screen+1)->num=2;
	(kan->screen+1)->seat=0;
	(kan->screen+1)->vip=20;
	(kan->screen+1)->gold=60;
	(kan->screen+1)->silver=40;
	(kan->screen+1)->total=120;
	(kan->screen+1)->status=AVAILABLE;

	//screen 3 initialisation
	(kan->screen+2)->num=3;
	(kan->screen+2)->seat=0;
	(kan->screen+2)->vip=20;
	(kan->screen+2)->gold=60;
	(kan->screen+2)->silver=40;
	(kan->screen+2)->total=120;
	(kan->screen+2)->status=AVAILABLE;
	return kan;
}
//----------------------------------------------------------------------
void screen_details(Kantara *kan,int screen_no)
{
	
	if(screen_no<1 && screen_no>3)
		printf("\n SCREEN NOT FOUND!!!! \n" );
	printf("\n ---------------------------------\n" );

	if(screen_no==1)
	{
		printf("SCREEN NUMBER: %d \n",kan->screen->num);
		printf("TOTAL SEATS AVAILABLE: %d \n",(kan->screen)->total);
		printf("VIP CLASS: %d \n",kan->screen->vip);
		printf("GOLD CLASS: %d \n",kan->screen->gold);
		printf("SILVER CLASS: %d \n",kan->screen->silver);

	}

	if(screen_no==2)
	{
		printf("SCREEN NUMBER: %d\n",(kan->screen+1)->num);
		printf("TOTAL SEATS AVAILABLE: %d \n",(kan->screen+1)->total);
		printf("VIP CLASS: %d \n",(kan->screen+1)->vip);
		printf("GOLD CLASS: %d \n",(kan->screen+1)->gold);
		printf("SILVER CLASS: %d \n",(kan->screen+1)->silver);

	}

	if(screen_no==3)
	{
		printf("SCREEN NUMBER: %d \n",(kan->screen+2)->num);
		printf("TOTAL SEATS AVAILABLE: %d \n",(kan->screen+2)->total);
		printf("VIP CLASS: %d \n",(kan->screen+2)->vip);
		printf("GOLD CLASS: %d \n",(kan->screen+2)->gold);
		printf("SILVER CLASS: %d \n",(kan->screen+2)->silver);

	}
	printf("\n ---------------------------------\n" );
}
//------------------------------------------------------------------------------------
Kantara * book_now()
{
	int screen_no,class,tickets,i,seat_number;
	Kantara *kan;
	printf("\n ----------------------------------------------\n" );
	printf("WELCOME TO INOX ONLINE BOOKING PORTAL\n");
	printf("Available screens are 1,2,3\n");
	printf("Enter the Screen Number(EX: 1 or 2 or 3):\n");
	scanf("%d",&screen_no);

	printf("Select the class(please enter serial number of the class)\n\\
		1.VIP\n\\
		2.GOLD\n\\
		3.SILVER\n");
	scanf("%d",&class);

	printf("Enter number of tickets:");
	scanf("%d",&tickets);
	
	if(screen_no==1)
	{
		switch(class)
			{
				case 1: 
					if(tickets > kan->screen->vip)
					{
						printf("seats not available\n");
						return kan;
					}
					else
					{
						
						seat_number=kan->screen->seat+1;
						kan->screen->seat=(kan->screen->seat)+tickets;
						kan->screen->vip = (kan->screen->vip)-tickets;
						kan->screen->total = (kan->screen->total)-tickets;
						printf("\n%d Tickets booked successfully.\n ",kan->screen->seat);
						/*for(i=seat_number;i<=kan->screen->seat;i++)
						{
							printf("Seats NO: \n%d",i);
						}*/
						screen_details(kan,screen_no);

						return kan;
					}	
				case 2: 
					if(tickets > kan->screen->gold)
					{
						printf("seats not available\n");
						return kan;
					}
					else
					{
						
						seat_number=kan->screen->seat+1;
						kan->screen->seat=(kan->screen->seat)+tickets;
						kan->screen->gold = (kan->screen->gold)-tickets;
						kan->screen->total = (kan->screen->total)-tickets;
						printf("\n%d Tickets booked successfully.\n ",kan->screen->seat);
						/*for(i=seat_number;i<=kan->screen->seat;i++)
						{
							printf("Seats NO: \n%d",i);
						}*/
						screen_details(kan,screen_no);
						return kan;
					}
				case 3: 
					if(tickets > kan->screen->silver)
					{
						printf("seats not available\n");
						return kan;
					}
					else
					{
						
						seat_number=kan->screen->seat+1;
						kan->screen->seat=(kan->screen->seat)+tickets;
						kan->screen->silver = (kan->screen->silver)-tickets;
						kan->screen->total = (kan->screen->total)-tickets;
						printf("\n%d Tickets booked successfully.\n ",kan->screen->seat);
						/*for(i=seat_number;i<=kan->screen->seat;i++)
						{
							printf("Seats NO: \n%d",i);
						}*/
						screen_details(kan,screen_no);
						return kan;
					}		
			}
	}
	if(screen_no==2)
	{
		switch(class)
			{
				case 1: 
					if(tickets > (kan->screen+1)->vip)
					{
						printf("seats not available\n");
						return kan;
					}
					else
					{
						
						seat_number=(kan->screen+1)->seat+1;
						(kan->screen+1)->seat=((kan->screen+1)->seat)+tickets;
						(kan->screen+1)->vip = ((kan->screen+1)->vip)-tickets;
						(kan->screen+1)->total = ((kan->screen+1)->total)-tickets;
						printf("\n%d Tickets booked successfully.\n ",(kan->screen+1)->seat);
						/*for(i=seat_number;i<=kan->screen->seat;i++)
						{
							printf("Seats NO: \n%d",i);
						}*/
						screen_details(kan,screen_no);
						return kan;
					}	
				case 2: 
					if(tickets > (kan->screen+1)->gold)
					{
						printf("seats not available\n");
						return kan;
					}
					else
					{
						
						seat_number=(kan->screen+1)->seat+1;
						(kan->screen+1)->seat=((kan->screen+1)->seat)+tickets;
						(kan->screen+1)->gold = ((kan->screen+1)->gold)-tickets;
						(kan->screen+1)->total = ((kan->screen+1)->total)-tickets;
						printf("\n%d Tickets booked successfully.\n ",(kan->screen+1)->seat);
						/*for(i=seat_number;i<=kan->screen->seat;i++)
						{
							printf("Seats NO: \n%d",i);
						}*/
						screen_details(kan,screen_no);
						return kan;
					}
				case 3: 
					if(tickets > (kan->screen+1)->silver)
					{
						printf("seats not available\n");
						return kan;
					}
					else
					{
						
						seat_number=(kan->screen+1)->seat+1;
						(kan->screen+1)->seat=((kan->screen+1)->seat)+tickets;
						(kan->screen+1)->silver = ((kan->screen+1)->silver)-tickets;
						(kan->screen+1)->total = ((kan->screen+1)->total)-tickets;
						printf("\n%d Tickets booked successfully.\n ",(kan->screen+1)->seat);
						/*for(i=seat_number;i<=kan->screen->seat;i++)
						{
							printf("Seats NO: \n%d",i);
						}*/
						screen_details(kan,screen_no);
						return kan;
					}		
			}
	}
	if(screen_no==3)
	{
		switch(class)
			{
				case 1: 
					if(tickets > (kan->screen+2)->vip)
					{
						printf("seats not available\n");
						return kan;
					}
					else
					{
						
						seat_number=(kan->screen+2)->seat+1;
						(kan->screen+2)->seat=((kan->screen+2)->seat)+tickets;
						(kan->screen+2)->vip = ((kan->screen+2)->vip)-tickets;
						(kan->screen+2)->total = ((kan->screen+2)->total)-tickets;
						printf("\n%d Tickets booked successfully.\n ",(kan->screen+2)->seat);
						/*for(i=seat_number;i<=kan->screen->seat;i++)
						{
							printf("Seats NO: \n%d",i);
						}*/
						screen_details(kan,screen_no);
						return kan;
					}	
				case 2: 
					if(tickets > (kan->screen+2)->gold)
					{
						printf("seats not available\n");
						return kan;
					}
					else
					{
						
						seat_number=(kan->screen+2)->seat+1;
						(kan->screen+2)->seat=((kan->screen+2)->seat)+tickets;
						(kan->screen+2)->gold = ((kan->screen+2)->gold)-tickets;
						(kan->screen+2)->total = ((kan->screen+2)->total)-tickets;
						printf("\n%d Tickets booked successfully.\n ",(kan->screen+2)->seat);
						/*for(i=seat_number;i<=kan->screen->seat;i++)
						{
							printf("Seats NO: \n%d",i);
						}*/
						screen_details(kan,screen_no);
						return kan;
					}
				case 3: 
					if(tickets > (kan->screen+2)->silver)
					{
						printf("seats not available\n");
						return kan;
					}
					else
					{
						
						seat_number=(kan->screen+2)->seat+1;
						(kan->screen+2)->seat=((kan->screen+2)->seat)+tickets;
						(kan->screen+2)->silver = ((kan->screen+2)->silver)-tickets;
						(kan->screen+2)->total = ((kan->screen+2)->total)-tickets;
						printf("\n%d Tickets booked successfully.\n ",(kan->screen+2)->seat);
						/*for(i=seat_number;i<=kan->screen->seat;i++)
						{
							printf("Seats NO: \n%d",i);
						}*/
						screen_details(kan,screen_no);
						return kan;
					}		
			}
	}
	
			
	
}

			
					
					
