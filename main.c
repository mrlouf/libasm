#include <stdio.h>
#include <string.h>

// Declaring the asm functions as extern
extern int		ft_strlen(char const *s);
extern char*	ft_strcpy(char *dest, char const *src);
extern int		ft_strcmp(char const *s1, char const *s2);

char const		*s1 = "Hello";
char			s2[20] = "World!";
char const		*s3 = NULL;


int	main()
{
	{
		printf("Testing strlen:\n");
		printf("%i\n", ft_strlen(""));
		printf("%lu\n", strlen(""));
		printf("%i\n", ft_strlen(s1));
		printf("%lu\n", strlen(s1));
		printf("\n");
	}
	{
		printf("Testing strcpy:\n");
		//printf("%s\n", ft_strcpy("", ""));
		//printf("%s\n", strcpy("", ""));
		printf("%s\n", ft_strcpy(s2, s1));
		printf("%s\n", strcpy(s2, s1));
		//printf("%s\n", ft_strcpy(s2, s3));
		//printf("%s\n", strcpy(s2, s3));
		printf("\n");
	}
	{
		printf("Testing strcmp:\n");
		printf("%i\n", ft_strcmp("", ""));
		printf("%i\n", strcmp("", ""));
		printf("%i\n", ft_strcmp("ABC", "ABC"));
		printf("%i\n", strcmp("ABC", "ABC"));
		printf("%i\n", ft_strcmp("ABC", "ABA"));
		printf("%i\n", strcmp("ABC", "ABA"));
		printf("\n");
	}
}
