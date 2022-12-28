#include<stdlib.h>
#include<assert.h>
#include "header.h"
int main()
{
	Kantara *kanta;
	kanta=init();
	assert(kanta->t_size==3);
	assert(kanta->screen->gold==80);
	assert((kanta->screen+1)->total==120);
	assert((kanta->screen+2)->num==3);

	screen_details(kanta,1);

	kanta=book_now();

	//screen_details(kanta,1);

}