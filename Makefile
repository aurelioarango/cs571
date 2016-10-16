#Author: Aurelio Arango
#
#

CC = g++ #compiler used
CFLAGS = -g -Wall #compilation flags
LIB = -lm	#link libraries
LDFLAGS = -L. #link flags
PROG = main.out #main program executable
OBJ = main.o Board.o  #target files to link
SRC = main.cpp Board.cpp#source files

all : $(PROG)

$(PROG): $(OBJ)
	$(CC) -c $(CFLAGS) $(SRC)
	$(CC) $(CFLAGS) -o $(PROG) $(OBJ) $(LDFLAGS) $(LIB)

clean:
	rm -f *.o $(PROG)
