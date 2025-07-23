NAME	= libasm.a

SRCS	= ft_strlen.s

OBJS	= $(SRCS:%.s=%.o)

CFLAGS	= -Werror -Wextra -Wall

all:	$(NAME)

%.o:	%.s Makefile
	nasm -f elf64 $< -o $@

$(NAME): $(OBJS) Makefile
	ar rcs $(NAME) $(OBJS)
	cc main.c -L. $(OBJS) -o test -lasm

clean:
	/bin/rm -f $(OBJS)

fclean:	clean
	/bin/rm -f $(NAME) test

re:	fclean all


.PHONY: libasm all clean fclean re
