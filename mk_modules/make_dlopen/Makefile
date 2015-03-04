
#export LD_LIBRARY_PATH=$(pwd)

.PHONY: all clean
CC = gcc
RM= rm -fr
MAIN:=main
SRCS := echo.c
all: $(OBJS) $(MAIN)
CFLAGS:= -Wall -O2

$(MAIN):
	$(CC) -fPIC -shared -nostartfiles -o libecho.so $(SRCS)
	$(CC) -o main main.c -ldl -rdynamic

clean:
	@ echo "Cleaning..."
	$(RM) -f *.o $(OBJS) main libecho.so .depend
