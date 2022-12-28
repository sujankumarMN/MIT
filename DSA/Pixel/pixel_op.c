#include "pixel.h"
#include<stdio.h>

Array initialisation(int size)
{
	Array arr;
	arr.c_size=0;
	arr.t_size= size>=0&&size<=MAXSIZE?size:MAXSIZE;
	arr.op_status=INIT_SUCCESS;
	return arr;

}
//-----------------------------------------------------------------------------------------------------------------
Array insert_data(Array arr,int r, int g, int b, float opacity, int transparency)
{
	
	if(arr.c_size==arr.t_size)
		arr.op_status=FULL;
	else
	{
		arr.p[arr.c_size].r=r;
		arr.p[arr.c_size].g=g;
		arr.p[arr.c_size].b=b;
		arr.p[arr.c_size].opacity=opacity;
		arr.p[arr.c_size].transparency=transparency;
		arr.op_status=SUCCESS;
		arr.c_size++;
	}	
	return arr;
}
//------------------------------------------------------------------------------------------------------------------
int count_red_pixels(Array arr)
{
	int i,count=0;
	for(i=0;i<arr.c_size;i++)
	{
		if(arr.p[i].r==255 && arr.p[i].g==0 && arr.p[i].b==0)
			count++;
		
	}
	return count;
}
//-------------------------------------------------------------------------------------------------------------------
int count_transparent_pixels(Array arr)
{
	int i,count=0;
	for(i=0;i<arr.c_size;i++)
	{
		if(arr.p[i].transparency==0)
			count++;
		
	}
	return count;

}
//--------------------------------------------------------------------------------------------------------------------
int check_if_any_two_pixels_are_same(Array arr)
{
	int i,j,flag=0;
	for(i=0;i<arr.c_size-1;i++)
	{
		for(j=i+1;j<arr.c_size;j++)
		{
			if((arr.p[i].r==arr.p[j].r)&&(arr.p[i].g==arr.p[j].g)&&(arr.p[i].b==arr.p[j].b)&&(arr.p[i].transparency==arr.p[j].transparency))//&&(arr.p[i].opacity==arr.p[j].opacity))
				flag=1;
		}
		if(flag==1)		
			return 1;
		else
			return 0;
	}
}
//----------------------------------------------------------------------------------------------------------------------
Pixel return_a_pixel_with_opacity_trans_is_zero(Array arr)
{
	int i,flag=0,temp;
	for(i=0;i<arr.c_size;i++)
	{
		if(arr.p[i].transparency==0 && arr.p[i].opacity==0)
		{
        	flag=1;
        	temp=i;		
		}
	}
	if(flag==1)		
		return arr.p[temp];
		
	
	else
		return arr.p[0];
}
//-----------------------------------------------------------------------------------------------------------------------
int check_if_given_pixel_is_opaque(Array arr)
{
	int i,count=0;
	for(i=0;i<arr.c_size;i++)
	{
		if(arr.p[i].opacity==0)
			count++;
		
	}
	return count;



}
			
	
