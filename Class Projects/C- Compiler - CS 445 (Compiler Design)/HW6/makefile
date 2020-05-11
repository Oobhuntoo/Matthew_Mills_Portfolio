BIN  = c-
CC   = g++
CFLAGS = -DCPLUSPLUS -g -std=c++11    # for use with C++ if file ext is .c
CPPFLAGS = -g -std=c++11
SRCS = $(BIN).y $(BIN).l util.c ourgetopt.c

CPPSRCS1 = printTree.cpp
CPPSRCS2 = semantic.cpp
CPPSRCS3 = yyerror.cpp

HDRS = scanType.h globals.h util.h ourgetopt.h

CPPHDRS1 = printTree.h
CPPHDRS2 = semantic.h
CPPHDRS3 = yyerror.h

OBJS = lex.yy.o $(BIN).tab.o util.o ourgetopt.o printTree.o semantic.o yyerror.o
LIBS = -lm 

$(BIN): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) $(LIBS) -o $(BIN)

$(CPPSRCS1).o: $(CPPSRCS1)
	      $(CC) $(CPPFLAGS) $(CPPSRCS1)

$(CPPSRCS2).o: $(CPPSRCS2)
	      $(CC) $(CPPFLAGS) $(CPPSRCS2)

$(CPPSRCS3).o: $(CPPSRCS3)
	      $(CC) $(CPPFLAGS) $(CPPSRCS3)


$(BIN).tab.h $(BIN).tab.c: $(BIN).y
	bison -v -t -d $(BIN).y  

lex.yy.c: $(BIN).l $(BIN).tab.h
	flex $(BIN).l

all:    
	touch $(SRCS)
	make

clean:
	rm -f $(OBJS) $(BIN) lex.yy.c $(BIN).tab.h $(BIN).tab.c $(BIN).tar $(BIN).output *~

tar:
	tar -cvf $(BIN).tar $(SRCS) $(HDRS) $(CPPSRCS1) $(CPPSRCS2) $(CPPSRCS3) $(CPPHDRS1) $(CPPHDRS2) $(CPPHDRS3) makefile 
	ls -l $(BIN).tar

