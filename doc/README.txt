
Goal :

- C++11 support ;
- Compiling jsc binary executable ;
- Simplified source code structure ;
- Drop the dependencies on generated files ( source files and header files ) ;


Hacking Roadmaps : 

- BAL
	unicode dependencies
	system memory alloc/release
	thread 

- JavascriptCore
	sunspider benchmark cli
	IDL extention 
	remove features : reg, math, date, event-listener, JIT, function 
	

Porting :

- Config
	JavaScriptCore/config.h

- Platform 
	Base/wtf/Platform.h

- Defines in Makefile
	DEFINES := \
        -DWTF_CHANGES \
        -DWTF_USE_ICU_UNICODE=0 \
        -DNDEBUG \
        -DWTF_USE_PTHREADS=1 \
        -DHAVE_PTHREAD_RWLOCK=1

	WTF_CHANGES , Memory Access related and visit api added. 
	NDEBUG , No Debug defined 


