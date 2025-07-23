NAME	= libasm.a

SRCS	=	ft_strlen.s		\
			ft_strcpy.s		\
			ft_strcmp.s		\
			ft_write.s		\
			ft_read.s		\
			ft_strdup.s

OBJS	= $(SRCS:%.s=%.o)

CFLAGS	= -Werror -Wextra -Wall

all:	$(NAME)

%.o:	%.s Makefile
	nasm -f elf64 $< -o $@

$(NAME): $(OBJS) Makefile main.c
	ar rcs $(NAME) $(OBJS)
	cc main.c -L. $(OBJS) -o test -lasm

clean:
	/bin/rm -f $(OBJS)

fclean:	clean
	/bin/rm -f $(NAME) test

re:	fclean all


.PHONY: libasm all clean fclean re
