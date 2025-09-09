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
extern void		ft_list_push_front(t_list **begin_list, void *data);
extern int		ft_list_size(t_list *begin_list);
extern void 	ft_list_sort(t_list **begin_list, int (*cmp)());
extern void 	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)());

// utils function to create lists
t_list *create_node(void *data) {
    t_list *node = malloc(sizeof(t_list));
    if (!node) return NULL;
    node->data = data;
    node->next = NULL;
    return node;
}

t_list *lst = NULL;

// Helper function to test ft_list_sort()
int	cmp(char *a, char *b)
{
	return (*a > *b ? 1 : 0);
}

int	cmp2(const char *s1, const char *s2)
{
	return (strcmp(s1, s2) == 0 ? 0 : 1);
}

int	main()
{
	char		*s1 = strdup("5");
	char		*s2 = strdup("9");
	char        *s3 = strdup("3");
	char		*s4 = strdup("8");

	char		*nullstr = "NULL";

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

       // add a fourth node
        new = create_node((void *) s4);
        ft_list_push_front(&lst, new);
        size = ft_list_size(lst);
        printf("List size: %d\n", size);
        printf("First element: %s\n", (char *)lst->data);
        printf("Second element: %s\n", (char *)lst->next->data);
        printf("Third element: %s\n", (char *)lst->next->next->data);
		printf("Fourth element: %s\n\n", (char *)lst->next->next->next->data);

        ft_list_sort(&lst, &cmp);
        printf("List after sorting:\n");
		printf("%s\n", (char *)lst->data);
        printf("%s\n", (char *)lst->next->data);
        printf("%s\n", (char *)lst->next->next->data);
		printf("%s\n", (char *)lst->next->next->next->data);
        printf("\n");

        // remove a node whose data contains "World!"
        ft_list_remove_if(&lst, (void *)s4, &cmp2, &free);
        size = ft_list_size(lst);
        printf("List size after removal: %d\n", size);
        printf("First element: %s\n", (char *)lst->data);
        printf("Second element: %s\n", (char *)lst->next->data);
		printf("Third element: %s\n", (char *)lst->next->next->data);
		if (lst->next->next->next)
			printf("Fourth element: %s\n", (char *)lst->next->next->next->data);
        printf("\n");
    }
    {
        printf("Testing ft_atoi_base with null string:\n");
        printf("%d\n", ft_atoi_base(NULL, "10"));
        printf("Testing ft_atoi_base with empty string:\n");
        printf("%d\n", ft_atoi_base("", "10"));
        printf("Testing ft_atoi_base with incorrect base:\n");
        printf("%d\n", ft_atoi_base("-42", "0"));
        printf("Testing ft_atoi_base with base 10:\n");
        printf("%d\n", ft_atoi_base("  \t -42", "0123456789"));

    }
    return 0;
}