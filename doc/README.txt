
Goal:
- Compiling jsc binary executable;
- Simplified source code structure;
- Drop the dependencies on generated files ( source files and header files );

Roadmap:
- BAL
	unicode dependencies
	system memory alloc/release
	thread 

- JavascriptCore
	sunspider benchmark cli
	IDL extention 
	remove features : reg, math, date, event-listener, JIT, function 
	


Porting:

- Platform 
	Base/wtf/Platform.h
	JavaScriptCore/wtf/Platform.h

- Defines in Makefile
	DEFINES := \
        -DWTF_CHANGES \
        -DWTF_USE_ICU_UNICODE=0 \
        -DNDEBUG \
        -DWTF_USE_PTHREADS=1 \
        -DHAVE_PTHREAD_RWLOCK=1

	WTF_CHANGES , 与内存访问有关，新增了visit接口。
	NDEBUG , No Debug defined 




