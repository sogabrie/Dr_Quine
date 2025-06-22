CC		= gcc
RM		= rm -rf
CFLAGS	= -z execstack -no-pie -Wall -Werror -Wextra

SRCC = Colleen.c
SRCG = Grace.c
SRCS = Sully.c

OBJC	= $(SRCC:%.s=%.o)
OBJG	= $(SRCG:%.s=%.o)
OBJS	= $(SRCS:%.s=%.o)


all:	Colleen Grace Sully

Colleen:	$(OBJC) Makefile
		$(CC) $(CFLAGS) $(OBJC) -o Colleen

Grace:	$(OBJG) Makefile
		$(CC) $(CFLAGS) $(OBJG) -o Grace

Sully:	$(OBJS) Makefile
		$(CC) $(CFLAGS) $(OBJS) -o Sully

%.o: %.s
	nasm -DFIRST -f elf64 $< -o $@

clean:
		$(RM) $(OBJC) $(OBJG) $(OBJS)

fclean: clean
		$(RM) Colleen Grace Sully Sully_* Grace_kid.s

re:	fclean all

.PHONY: all clean fclean re