
#include "array.h"

Array initialize_array(int size)
{
 Array my_arr;
 my_arr.c_size=0;
 my_arr.t_size= size>=0 && size<=MAXSIZE?size:MAXSIZE;
 return my_arr;
}

Array insert_data(Array my_arr,int data)
{
 if(my_arr.c_size==my_arr.t_size)
  
  my_arr.op_status=FULL;  
 else
 {
  my_arr.array[my_arr.c_size]=data;
  my_arr.c_size++;
  my_arr.op_status = SUCCESS;
 }
 return my_arr;
}

int search(Array my_arr,int data)
{
 int i;
 for(i=0;i<my_arr.c_size;i++)
 {
  if(my_arr.array[i]==data)
   return 1;
 }
 return 0;
}

void max_min(Array my_arr,int *max,int * min)
{
 int i;
 *max=*min=my_arr.array[0];
 for(i=0;i<my_arr.c_size;i++)
 {
  if(my_arr.array[i] > *max)
  
    *max=my_arr.array[i];
  if(my_arr.array[i]<*min)
    *min=my_arr.array[i];
 }
}
int sum_of_array(Array my_arr)
{
    int i,sum=0;
    for(i=0;i<my_arr.c_size;i++)
    {
        sum=sum+my_arr.array[i];
    }
    return sum;
}

int prime_number(int n)
{
    int i;
    for(i=2;i<n/2;i++)
    {
        if(n%i==0)
            return 0;
    }
    return 1;
}
int count_number_of_prime_numbers(Array my_arr)
{
    int i,count=0;
    for(i=0;i<my_arr.c_size;i++)
    {
        if(prime_number(my_arr.array[i]))
            count++;
    }
    return count;
}

int array_palindrome(Array my_arr)
{
    int i;
    for(i=0;i<my_arr.c_size;i++)
    {
        if (my_arr.array[i]!=my_arr.array[my_arr.c_size-1-i])
        {
            return 0;
        }
        return 1;
    }
}
  
