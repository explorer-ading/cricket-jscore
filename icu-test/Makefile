
CC := g++
LD := g++
CPPFLAGS := -g -O2 -D_REENTRANT -I../doc/include/ -Wno-format
LDFLAGS := -rdynamic -lpthread -lm -L../doc/lib/ -licudata -licui18n -licuio -licule -liculx -licutu -licuuc


.PHONY: test props ustring clean run-test

all: props 

test:
	#c++ -o tt test.cpp ${CPPFLAGS} ${LDFLAGS} `icu-config --ldflags-system --ldflags`
	$(CC) test.cpp $(CPPFLAGS) -c 
	$(LD) test.o -o $@ $(LDFLAGS)

props:
	#g++ -g -O2 -D_REENTRANT -Wno-format -I/home/chao/usr/include  -c props.cpp -o props.o
	#g++ -g -O2 -D_REENTRANT -I/home/chao/usr/include -lpthread -lm -L/home/chao/usr/lib -licui18n -licuuc -licudata -lpthread -lm  props.o   -o props
	$(CC) props.cpp $(CPPFLAGS) -c 
	$(LD) props.o -o $@ $(LDFLAGS)

ustring:
	#g++ -g -O2 -D_REENTRANT -I/home/chao/usr/include  -c ustring.cpp -o ustring.o
	#g++ -g -O2 -D_REENTRANT -I/home/chao/usr/include -lpthread -lm -L/home/chao/usr/lib -licui18n -licuuc -licudata -lpthread -lm  ustring.o   -o ustring
	$(CC) ustring.cpp $(CPPFLAGS) -c 
	$(LD) ustring.o -o $@ $(LDFLAGS)

clean:
	rm -f *o
	rm -f test props ustring

run-test:
	./run-test.sh test
	

