CC		= gcc
RM		= rm -rf
CFLAGS	= -Wall -Werror -Wextra

SRCC = Colleen.c
SRCG = Grace.c
SRCS = Sully.c

OBJC	= $(SRCC:.c=.o)
OBJG	= $(SRCG:.c=.o)
OBJS	= $(SRCS:.c=.o)

all:	Colleen Grace Sully

Colleen:	$(OBJC) Makefile
		$(CC) $(CFLAGS) $(OBJC) -o Colleen

Grace:	$(OBJG) Makefile
		$(CC) $(CFLAGS) $(OBJG) -o Grace

Sully:	$(OBJS) Makefile
		$(CC) $(CFLAGS) $(OBJS) -o Sully

clean:
		$(RM) $(OBJC) $(OBJG) $(OBJS)

fclean: clean
		$(RM) Colleen Grace Sully Sully_* Grace_kid.c

re:	fclean all

.PHONY: all clean fclean re