#include<stdio.h>
#include<assert.h>
#include "pixel.h"

int main()
{
	
	Array my_arr;
	Pixel my_pixel;
	my_arr=initialisation(8);
	assert(my_arr.t_size==8);
	assert(my_arr.op_status==2);

	my_arr=insert_data(my_arr,1,2,1,0.4,1);
	my_arr=insert_data(my_arr,10,67,211,1,1);
	my_arr=insert_data(my_arr,1,2,1,0.9,0);
	assert(my_arr.c_size==3);
	assert(my_arr.p[my_arr.c_size-2].transparency==1);
	assert(my_arr.op_status==SUCCESS);

	my_arr=insert_data(my_arr,255,0,0,0.2,1);
	my_arr=insert_data(my_arr,111,99,83,0,0);
	my_arr=insert_data(my_arr,10,67,211,1,1);
	my_arr=insert_data(my_arr,1,2,1,0,1);
	my_arr=insert_data(my_arr,255,0,0,1,0);
	assert(my_arr.c_size==8);
	assert(my_arr.p[my_arr.c_size-2].transparency==1);
	assert(my_arr.op_status==SUCCESS);

	my_arr=insert_data(my_arr,1,0,0,1,1);
	assert(my_arr.op_status==FULL);
	assert(my_arr.c_size==8);
	assert(my_arr.p[my_arr.c_size-1].transparency==0);
	assert(my_arr.p[1].opacity==my_arr.p[5].opacity);

	int count;
	count=count_red_pixels(my_arr);
	assert(count==2);

	count=count_transparent_pixels(my_arr);
	assert(count==3);

	count=check_if_any_two_pixels_are_same(my_arr);
	assert(count==1);

	my_pixel=return_a_pixel_with_opacity_trans_is_zero(my_arr);
	assert(my_pixel.r==111&&my_pixel.transparency==0);

	count=check_if_given_pixel_is_opaque(my_arr);
	assert(count==1);




}