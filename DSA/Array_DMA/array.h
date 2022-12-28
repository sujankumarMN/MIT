#define FAIL 0
#define INIT_SUCCESS 1
#define FULL 2
#define SUCCESS 3
typedef struct _array_
{
	int *arr;
	int c_size,t_size,op_status;
} Array;

Array * initialise(int);
int insert_data(Array *,int);
int search(Array *,int);
void max_min(Array *, int *,int *);
Array * merge_array(Array *,Array *);
Array * deallocate(Array *);	
Array * split_array(Array *,int index);													