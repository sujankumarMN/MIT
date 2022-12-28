#include<assert.h>
#include "array.h"

int main()
{
     Array my_array;
     int min,max;
     my_array=initialize_array(6);
     assert(my_array.t_size==6);

     my_array=insert_data(my_array,10);
     my_array=insert_data(my_array,2);
     my_array=insert_data(my_array,2);
     my_array=insert_data(my_array,10);
     assert(my_array.array[my_array.c_size-1]==10);
     
     assert(search(my_array,2)==1);
     max_min(my_array,&max,&min);
     assert(max==10);
     assert(min==2);
     assert(sum_of_array(my_array)==24);

     assert(prime_number(11)==1);
     assert(count_number_of_prime_numbers(my_array)==2);
     assert(array_palindrome(my_array)==1);


}
