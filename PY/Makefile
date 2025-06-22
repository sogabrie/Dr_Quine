CC		= python3
RM		= rm -rf

SRCC = Colleen.py
SRCG = Grace.py
SRCS = Sully.py

all:	Colleen Grace Sully

Colleen:	$(SRCC) Makefile
		$(CC) $(SRCC)

Grace:	$(SRCG ) Makefile
		$(CC) $(SRCG)

Sully:	$(SRCS) Makefile
		$(CC) $(SRCS)

fclean:
		$(RM) Sully_* Grace_kid.py

re:	fclean all

.PHONY: all fclean re