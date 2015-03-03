
TOP=.
include $(TOP)/config
include $(TOP)/Make.rules

SRC = $(TOP)/src
MAIN = $(TOP)/main
ALL_DIRS = $(SRC) $(MAIN)
.PHONY: all clean

all: fake_main
fake_main:
	@ for dir in $(ALL_DIRS); do $(MAKE) -C $$dir; done
	@$(CC) -o $@ $(SRC)/*.o $(MAIN)/*.o 
	@echo "finish building $@..."

clean:
	@ for dir in $(ALL_DIRS); do $(MAKE) -C $$dir clean; done
	@$(RM) fake_main *.o .depend
	@echo "finish cleaning ..."
