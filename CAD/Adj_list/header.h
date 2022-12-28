#define INSERTED 1

typedef struct _node_ Node;
struct _node_
{
	int vertice_no;
	int weight;
	Node *ptr;
};

typedef struct _list_ List;
struct _list_
{
	int vertice_no;
	Node *head;
	Node *tail;
	List *ptr;
};

struct _graph_
{
	List *graph_head;
	List *graph_tail;
	int count_graph;
};
typedef struct _graph_ Graph;

Graph * graph_init();
List * get_list(int );
int insert_vertice(Graph *,char []);
List * search(Graph *,int);


