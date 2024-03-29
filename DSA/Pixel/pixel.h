#define MAXSIZE 10
#define FULL 0
#define SUCCESS 1
#define INIT_SUCCESS 2

struct _pixel_
{
	unsigned int r,g,b;
	float opacity;
	int transparency;
} ;
typedef struct _pixel_ Pixel;

struct _array_
{
	Pixel p[MAXSIZE];
	int c_size,t_size,op_status;
};
typedef struct _array_ Array;

Array initialisation(int);
Array insert_data(Array,int,int,int,float,int);
int count_red_pixels(Array);
int count_transparent_pixels(Array);
int check_if_any_two_pixels_are_same(Array);
Pixel return_a_pixel_with_opacity_trans_is_zero(Array);
