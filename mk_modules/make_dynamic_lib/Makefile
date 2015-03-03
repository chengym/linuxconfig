
#export LD_LIBRARY_PATH=$(pwd)

.PHONY: all clean
CC=gcc
RM= rm -fr
SRCS := hello.c
OBJS := $(patsubst %.cxx,%.o,$(patsubst %.c,%.o,$(SRCS)))
all: $(OBJS) hello
CFLAGS:= -Wall -O2

hello:
	$(CC) -fPIC -shared -o libhello.so hello.c
	$(CC) -c main.c
	$(CC) -o $@ main.o -L. -lhello

%.o : %.c
	$(CC) $(CFLAGS) -c $<

clean:
	@ echo "Cleaning..."
	$(RM) -f *.o $(OBJS) hello libhello.so .depend
