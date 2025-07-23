NAME	= libasm

SRCS	= ft_strlen.s

OBJS	= $(SRCS:%.s=%.o)



all:	$(NAME)

%.o:	%.s Makefile
	nasm -f elf $< -o $@

$(NAME): $(OBJS) $(SRCS) Makefile
	ld -m elf_i386 -s -o $(NAME) $(OBJS)

clean:
	/bin/rm -f $(OBJS)

fclean:	clean
	/bin/rm -f $(NAME)

re:	fclean all


.PHONY: libasm all clean fclean re
