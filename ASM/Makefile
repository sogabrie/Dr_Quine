CC		= gcc
ACC 	= nasm
RM		= rm -rf
CFLAGS	= -z execstack -no-pie -Wall -Werror -Wextra
AFLAGS	= -DFIRST -f elf64

SRCC = Colleen.s
SRCG = Grace.s
SRCS = Sully.s

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
	$(ACC) $(AFLAGS) $< -o $@

clean:
		$(RM) $(OBJC) $(OBJG) $(OBJS)

fclean: clean
		$(RM) Colleen Grace Sully Sully_* Grace_kid.s

re:	fclean all

.PHONY: all clean fclean re
