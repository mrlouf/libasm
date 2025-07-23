#include <stdio.h>
#include <string.h>

// Declaring the asm functions as extern
extern int	ft_strlen(char const *s);

char const		*str = "Hello world";

int	main()
{
	printf("%i\n", ft_strlen(str));
	printf("%lu\n", strlen(str));
}
