#define MAXSIZE 30
#define INIT_ARRAY 0
#define SUCCESS 1
#define FULL 2

struct _array_
{
 int array[MAXSIZE];
 int c_size,t_size,op_status;
};
typedef struct _array_ Array;

Array initialize_array(int);
Array insert_data(Array,int);
int search(Array,int);
void max_min(Array,int *,int *);
int sum_of_array(Array);
int prime_number(int);
int count_number_of_prime_numbers(Array);
int array_palindrome(Array);

