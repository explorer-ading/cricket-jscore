
CPPFLAGS := -I../doc/include/ -Wformat
LDFLAGS := -rdynamic -lpthread -lm -L../usr/lib/ -licudata -licui18n -licuio -licule -liculx -licutu -licuuc


all:
	#c++ -o tt test.cpp ${CPPFLAGS} ${LDFLAGS} `icu-config --ldflags-system --ldflags`
	c++ -o tt test.cpp $(CPPFLAGS) $(LDFLAGS)

	#c++ -o props props.cpp $(CPPFLAGS) $(LDFLAGS)
	#c++ -o ustring ustring.cpp $(CPPFLAGS) $(LDFLAGS)

