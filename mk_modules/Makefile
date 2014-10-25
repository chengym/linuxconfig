OBJECTS=\
	test \
	run	
############################################################
.PHONY : all

all : $(OBJECTS)
#	cp -f $(OBJECTS) ../bin/

test : test.cxx
	g++ -I ../inc -lpthread -o $@ $^
run : run.cxx
	g++ -I ../inc -lpthread -o $@ $^
#	cp $@ ../bin

