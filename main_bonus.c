#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>

// declaring the struct for linked list
typedef struct s_list {
    void *data;
    struct s_list *next;
}   t_list;

// bonus functions
extern int		ft_atoi_base(char const *str, char const *base);
extern void 	ft_list_push_front(t_list **begin_list, t_list *new);
extern int		ft_list_size(t_list *begin_list);
extern void 	ft_list_sort(t_list **begin_list, int (*cmp)());
extern void 	ft_list_remove_if(t_list **begin_list, /* is it t_list here? */t_list *data_ref, int (*cmp)(), void (*free_fct)());

// utils functions to create lists
t_list *create_node(void *data) {
    t_list *node = malloc(sizeof(t_list));
    if (!node) return NULL;
    node->data = data;
    node->next = NULL;
    return node;
}

char		*s1 = "Hello";
char		*s2 = "World!";
char		*s3 = NULL;

t_list *lst = NULL;

int	main()
{
    {
        int size = ft_list_size(lst);
        printf("List size: %d\n", size);
        lst = create_node((void *) s1);
        size = ft_list_size(lst);
        printf("List size: %d\n", size);
        t_list *new = create_node((void *) s2);
        ft_list_push_front(&lst, new);
        size = ft_list_size(lst);
        printf("List size: %d\n", size);
        printf("First element: %s\n", (char *)lst->data);
        printf("Second element: %s\n", (char *)lst->next->data);
        new = create_node((void *) s3);
        ft_list_push_front(&lst, new);
        size = ft_list_size(lst);
        printf("List size: %d\n", size);
        printf("First element: %s\n", (char *)lst->data);
        printf("Second element: %s\n", (char *)lst->next->data);
        printf("Third element: %s\n", (char *)lst->next->next->data);
    }
    return 0;
}