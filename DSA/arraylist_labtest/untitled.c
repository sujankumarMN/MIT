/*
			break;
		case 2:
			switch(class)
			
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
						return kan;
					}	
				
				case 3: 
					if(tickets > (kan->screen+1)->silver)
					{
						printf("seats not available\n");
						return kan;
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
						return kan;
					}	
				
			
			break;
		case 3: 
			switch(class)
			
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
						printf("\n%d Tickets booked successfully.\n ",kan->screen->seat);
						/*for(i=seat_number;i<=kan->screen->seat;i++)
						{
							printf("Seats NO: \n%d",i);
						}*/
						return kan;
					}	
				
				case 3: 
					if(tickets > (kan->screen+2)->silver)
					{
						printf("seats not available\n");
						return kan;
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
						return kan;
					}	
				
			}
			break;
		


	
	



	return kan;



