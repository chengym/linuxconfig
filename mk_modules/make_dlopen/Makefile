
#export LD_LIBRARY_PATH=$(pwd)

.PHONY: all clean
CC=gcc
RM= rm -fr
MAIN:=main
SRCS := getmaxlen.c
OBJS := $(patsubst %.cxx,%.o,$(patsubst %.c,%.o,$(SRCS)))
all: $(OBJS) MAIN
CFLAGS:= -Wall -O2

$(MAIN):
	$(CC) -fPIC -shared -o libgetmaxlen.so $(OBJS)
	$(CC) –o $@ main.c -ldl

%.o : %.c
	$(CC) $(CFLAGS) -c $<

clean:
	@ echo "Cleaning..."
	$(RM) -f *.o $(OBJS) main libgetmaxlen.so .depend
