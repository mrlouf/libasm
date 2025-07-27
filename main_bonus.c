#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>

// bonus functions
extern int		ft_atoi_base(char const *str, char const *base);
extern void 	ft_list_push_front(void **begin_list, void *data);
extern int		ft_list_size(void *begin_list);
extern void 	ft_list_sort(void **begin_list, int (*cmp)());
extern void 	ft_list_remove_if(void **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)());

// declaring the struct for linked list
typedef struct s_list {
    void *data;
    struct s_list *next;
}   t_list;

char const		*s1 = "Hello";
char			s2[20] = "World!";
char const		*s3 = NULL;

int	main()
{

    return 0;
}