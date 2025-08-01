NAME	= libasm.a

SRCS	=	ft_strlen.s		\
			ft_strcpy.s		\
			ft_strcmp.s		\
			ft_write.s		\
			ft_read.s		\
			ft_strdup.s

SRCS_BONUS	=	ft_atoi_base_bonus.s	\
			ft_list_push_front_bonus.s	\
			ft_list_size_bonus.s		\
			ft_list_sort_bonus.s		\
			ft_list_remove_if_bonus.s

OBJDIR	= .obj

OBJS	= $(addprefix $(OBJDIR)/, $(SRCS:.s=.o))
OBJS_BONUS	= $(addprefix $(OBJDIR)/, $(SRCS_BONUS:.s=.o))

CFLAGS	= -Werror -Wextra -Wall

all:	$(NAME)

$(OBJDIR)/%.o:	%.s Makefile
	mkdir -p $(@D)
	nasm -f elf64 -g $< -o $@

$(NAME): $(OBJS) Makefile main.c
	ar rcs $(NAME) $(OBJS)
	gcc -g main.c -L. $(OBJS) -o test

$(OBJDIR)/%_bonus.o:	%_bonus.s Makefile
	mkdir -p $(@D)
	nasm -f elf64 -g $< -o $@

bonus: $(OBJS_BONUS) Makefile main_bonus.c
	ar rcs $(NAME) $(OBJS_BONUS)
	gcc -g main_bonus.c -L. $(OBJS_BONUS) -o test_bonus

clean:
	/bin/rm -fr $(OBJDIR)

fclean:	clean
	/bin/rm -f $(NAME) test test_bonus

re:	fclean all

.PHONY: libasm all clean fclean re bonus