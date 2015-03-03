TOP=..
include $(TOP)/config
include $(TOP)/Make.rules

INC =-I$(TOP)/inc
.PHONY: all clean
SRCS = $(wildcard *.c .cxx)
OBJS := $(patsubst %.cxx,%.o,$(patsubst %.c,%.o,$(SRCS)))
all: $(OBJS)

%.o : %.c
	@$(CC) -c $< $(CFLAGS) $(INC)

clean:
	@ echo "Cleaning..."
	@$(RM) $(OBJS) *.o .depend
