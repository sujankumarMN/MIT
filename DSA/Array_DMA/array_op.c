#include<stdlib.h>
#include "array.h"


Array * initialise(int size)
{
	Array *array;
	array=(Array *)malloc(sizeof(Array));
	if(NULL==array) return NULL;
	array->arr=(int *)malloc(sizeof(int)*size);
	array->c_size=0;
	array->t_size=size;
	array->op_status = INIT_SUCCESS;
	//return array;
}
//----------------------------------------------------------------------------
int insert_data(Array *array,int data)
{
	if(array->c_size==array->t_size)
	{
		array->op_status=FULL;
		return FULL;
	}	
	


	*(array->arr + array->c_size) = data;
	array->c_size++;
	array->op_status=SUCCESS;
	return SUCCESS; 
}
//-----------------------------------------------------------------------------
int search(Array *array, int data)
{
	int i,flag=0;
	for(i=0;i<array->c_size;i++)
	{
		if(*(array->arr+i)==data)
		{
			return i;
			flag=1;
		}
		
	}
	if(flag==0)
		return -1;
}
//-----------------------------------------------------------------------------
void max_min(Array *array, int *max, int *min)
{
	*max=*min= array->arr[0];
	int i;
	for(i=0;i<array->c_size;i++)
	{ 
		if(array->arr[i]>*max)
			*max=array->arr[i];
		if(array->arr[i]<*min)
			*min=array->arr[i];

	}
	
}
//------------------------------------------------------------------------------
Array * deallocate(Array *array)
{
	free(array->arr);
	free(array);
	return NULL;
}
//------------------------------------------------------------------------------
Array * merge_array(Array *a,Array *b)
{
	int updated_size,i,j;
	if(a==NULL) return b;
	if(b==NULL) return NULL;
	updated_size=a->c_size+b->c_size;
	if(a->t_size<updated_size)
	{
		a->arr=realloc(a->arr,(updated_size*sizeof(int)));
		a->t_size=updated_size;
	}

	for(i=0;i<(b->c_size);i++)
	
		insert_data(a,*(b->arr + i));
	
	b=deallocate(b);
	return b;
}
//------------------------------------------------------------------------------
Array * split_array(Array *a,int index)
{
	Array *b;
	int i;

	int updated_size_a=index+1;
	int updated_size_b=a->c_size-(index+1);

	//All the elements till the mentioned index will store in the 1st array
	//Remaining elements will store in 2nd array
	if(index >= 0 && index< a->c_size && a!=NULL)
	{
		a->c_size=updated_size_a; //c-size of the first array is reduced based on the index mentioned

		b = initialise(updated_size_b);
	
		for(i=updated_size_a;i<a->t_size;i++)
			insert_data(b,*(a->arr + i));
		
		return b;

	}
	else
		return NULL;
	
}


while((ch = fgetc(fp)) != '\n');