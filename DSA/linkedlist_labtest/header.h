#define INSERTED 1
struct _squad_
{
	char name[20];
	char position[3];
	int sub; // 0 : playing 11 || 1: substitute
};
typedef struct _squad_ Squad;

typedef struct _node_ Node;
struct _node_
{
	Squad *squad;
	Node *ptr;
};

struct _list_
{
	Node *head;
	Node *tail;
	int count;
};
typedef struct _list_ List;

List * init();
void substitute(List *,char [],char []);
Node * getnode(Squad);
int insert_player(List *,Squad);


