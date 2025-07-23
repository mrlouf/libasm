#include <stdio.h>
#include <string.h>

// Declaring the asm functions as extern
extern int	ft_strlen(char const *s);

char const		*str = "Hello world";

int	main()
{
	printf("%i", ft_strlen("dsa"));
	printf("%lu", strlen(str));
}
