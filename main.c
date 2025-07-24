#include <stdio.h>
#include <string.h>

// Declaring the asm functions as extern
extern int		ft_strlen(char const *s);
extern char*	ft_strcpy(char *dest, char const *src);

char const		*s1 = "Hello";
char			s2[20] = "World!";
char const		*s3 = NULL;


int	main()
{
	{
		printf("%i\n", ft_strlen(""));
		printf("%lu\n", strlen(""));
		printf("%i\n", ft_strlen(s1));
		printf("%lu\n", strlen(s1));

		//printf("%s\n", ft_strcpy("", ""));
		//printf("%s\n", strcpy("", ""));
		printf("%s\n", ft_strcpy(s2, s1));
		printf("%s\n", strcpy(s2, s1));
		printf("%s\n", ft_strcpy(s2, s3));
		//printf("%s\n", strcpy(s2, s3));
	}
}
