#include<assert.h>
#include<stdlib.h>
#include "array.h"
#include<stdio.h>
int main()
{
	Array *my_array;
	int max,min;
	my_array = initialise(10);
	assert(my_array->t_size == 10);

	insert_data(my_array,232);
	insert_data(my_array,1);
	insert_data(my_array,7);
	
	assert(my_array->c_size==3);
    assert(*(my_array->arr + 2)==7);
    assert(*(my_array->arr + 1)==1);
    
    assert(insert_data(my_array,9)==SUCCESS);
    
    assert(my_array->c_size==4);
    
    int i;
    for(i=0;i<10;i++)
    {
    	insert_data(my_array,i);
    }

    assert(*(my_array->arr+9)==5);
    assert(my_array->c_size==10);
    assert(my_array->op_status==FULL);

    assert(search(my_array,7) == 2);
    assert(search(my_array,5) == 9);
    max_min(my_array,&max,&min);
    assert(max==232);
    assert(min==0);

    Array *arr_a,*arr_b;
    arr_a = initialise(5);
    arr_b = initialise(7);
  
    insert_data(arr_a,9);
    insert_data(arr_a,8);
    insert_data(arr_a,7);
    insert_data(arr_a,6);
    insert_data(arr_a,5);    

    insert_data(arr_b,19);
    insert_data(arr_b,18);
    insert_data(arr_b,17);
    insert_data(arr_b,16);
    insert_data(arr_b,15);
    insert_data(arr_b,14); 

    arr_b=merge_array(arr_a,arr_b);

    assert(arr_a->arr[7]==17);   

    assert(arr_b==NULL);

  
    arr_b = split_array(arr_a,8);
    assert(*(arr_b->arr + 1)== 14);



    assert(deallocate(my_array)==NULL);




	


	
}