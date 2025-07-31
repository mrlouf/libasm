#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>

// declaring the struct for linked list
typedef struct s_list {
    void *data;
    struct s_list *next;
}   t_list;

// bonus functions (prototypes are from the Piscine's subject)
extern int		ft_atoi_base(char const *str, char const *base);
extern void 	ft_list_push_front(t_list **begin_list, t_list *new);
extern int		ft_list_size(t_list *begin_list);
extern void 	ft_list_sort(t_list **begin_list, int (*cmp)());
extern void 	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)());

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
char        *s4 = "Cucufu";

t_list *lst = NULL;

int	main()
{
    {
        int size = ft_list_size(lst);
        printf("List size: %d\n\n", size);

        // add a node to the list
        lst = create_node((void *) s1);
        size = ft_list_size(lst);
        printf("List size: %d\n", size);
        printf("First element: %s\n\n", (char *)lst->data);

        // add another node
        t_list *new = create_node((void *) s2);
        ft_list_push_front(&lst, new);
        size = ft_list_size(lst);
        printf("List size: %d\n", size);
        printf("First element: %s\n", (char *)lst->data);
        printf("Second element: %s\n\n", (char *)lst->next->data);

        // add a third node
        new = create_node((void *) s3);
        ft_list_push_front(&lst, new);
        size = ft_list_size(lst);
        printf("List size: %d\n", size);
        printf("First element: %s\n", (char *)lst->data);
        printf("Second element: %s\n", (char *)lst->next->data);
        printf("Third element: %s\n\n", (char *)lst->next->next->data);

        // remove a node whose data contains "World!"
/*         ft_list_remove_if(&lst, (void *)s2, strcmp, free);
        size = ft_list_size(lst);
        printf("List size after removal: %d\n", size);
        printf("First element: %s\n", (char *)lst->data);
        printf("Second element: %s\n", (char *)lst->next->data); */
    }
    {
        printf("Testing ft_atoi_base with base 10:\n");
        char *str1 = "12345";
        printf("%d\n", ft_atoi_base(str1, "10"));
    }
    return 0;
}