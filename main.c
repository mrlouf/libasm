#include <stdio.h>
#include <string.h>

// Declaring the asm functions as extern
extern size_t	ft_strlen(char const *s);

char const		*str = "Hello world";

int	main()
{
	printf("%lu", ft_strlen(str));
	printf("%lu", strlen(str));
}
