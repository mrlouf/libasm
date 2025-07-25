#include <stdio.h>
#include <string.h>
#include <unistd.h>

// Declaring the asm functions as extern
extern size_t	ft_strlen(char const *s);
extern char*	ft_strcpy(char *dest, char const *src);
extern int		ft_strcmp(char const *s1, char const *s2);
extern ssize_t	ft_write(int fd, const void *buf, size_t count);

char const		*s1 = "Hello";
char			s2[20] = "World!";
char const		*s3 = NULL;


int	main()
{
	{
		printf("Testing strlen:\n");
		printf("%lu\n", ft_strlen(""));
		printf("%lu\n", strlen(""));
		printf("%lu\n", ft_strlen(s1));
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
		struct {
			const char *a;
			const char *b;
		} tests[] = {
			{"", ""},
			{"A", ""},
			{"", "A"},
			{"A", "A"},
			{"ABC", "ABC"},
			{"ABC", "ABD"},
			{"ABD", "ABC"},
			{"ABC", "ABA"},
			{"ABA", "ABC"},
			{"Hello", "Hello"},
			{"Hello", "Hellp"},
			{"Hellp", "Hello"},
			{"Hello", "Hell"},
			{"Hell", "Hello"},
			{"", "abc"},
			{"abc", ""},
			{"abc", "abc"},
			{"abc", "abd"},
			{"abd", "abc"},
			{NULL, NULL}
		};

		for (int i = 0; tests[i].a != NULL; i++) {
			int std = strcmp(tests[i].a, tests[i].b);
			int ft = ft_strcmp(tests[i].a, tests[i].b);
			printf("Test %2d: ft_strcmp(\"%s\", \"%s\") = %d | strcmp = %d\n",
				i, tests[i].a, tests[i].b, ft, std);
		}
		printf("\n");
	}
	{
		printf("Testing write:\n");
		ft_write(1, "Hello, World!\n", 14);
		write(1, "Hello, World!\n", 14);
		ft_write(1, "This is a test of ft_write.\n", 10);
		ft_write(1, "\n", 1);
		write(1, "This is a test of write.\n", 10);
		ft_write(1, "\n", 1);
		ft_write(42, "This should fail and print nothing.\n", 38);
		write(42, "This should also fail and print nothing.\n", 42);
		ft_write(1, "", 0);
		write(1, "", 0);

		printf("\n");
	}
	{
		
	}
}