NAME	= libasm.a

SRCS	=	ft_strlen.s		\
			ft_strcpy.s		\
			ft_strcmp.s		\
			ft_write.s		\
			ft_read.s		\
			ft_strdup.s

OBJDIR	= .obj

OBJS	= $(addprefix $(OBJDIR)/, $(SRCS:.s=.o))

CFLAGS	= -Werror -Wextra -Wall

all:	$(NAME)

$(OBJDIR)/%.o:	%.s Makefile
	mkdir -p $(@D)
	nasm -f elf64 -g $< -o $@

$(NAME): $(OBJS) Makefile main.c
	ar rcs $(NAME) $(OBJS)
	gcc -g main.c -L. $(OBJS) -o test -O0

clean:
	/bin/rm -fr $(OBJDIR)

fclean:	clean
	/bin/rm -f $(NAME) test

re:	fclean all

.PHONY: libasm all clean fclean re