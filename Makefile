
# Search for keyword 'FIXME: adingx' for all modifications 

CX := c++
LD := c++

USERDIR := doc/include
USERLIBDIR := doc/lib

OUTDIR := out
JSCDIR := JavaScriptCore
OWBTRUNK := .
OWBGENERATEDLINK := $(OUTDIR)

#defines
DEFINES := \
		-DWTF_CHANGES \
		-DWTF_USE_ICU_UNICODE=1 \
		-DWTF_USE_CURL=1 \
		-DWTF_USE_CURL_OPENSSL=1 \
		-DNDEBUG \
		-DENABLE_OWB_TRACES=1 \
		-DENABLE_NETSCAPE_PLUGIN_API=0 \
		-DUSE_FREETYPE=1 \
		-DWTF_PLATFORM_SDLCAIRO=1 \
		-DWTF_PLATFORM_BAL=1 \
		-DWTF_PLATFORM_CAIRO=1 \
		-DUSE_FREETYPE=1 \
		-DWTF_USE_BALI18N=1 \
		-DWTF_USE_PTHREADS=1 \
		-DHAVE_PTHREAD_RWLOCK=1

#flags
#CXFLAGS := -Wall -W -Wcast-align -Wchar-subscripts -Wreturn-type -Wformat -Wformat-security -Wno-format-y2k -Wundef -Wmissing-format-attribute -Wpointer-arith -Wwrite-strings -Wno-unused-parameter -Wno-parentheses -Wno-unused-local-typedefs -Wno-narrowing -Wno-unused-const-variable -fvisibility-inlines-hidden -fPIC -fvisibility=hidden -fstrict-aliasing -O3

CXFLAGS := -Wall -std=c++11 -g -O0 -c

LDFLAGS := -fno-rtti -fno-exceptions

TARGET := jsc

#JSCLDFLAGS := -rdynamic -lpthread -L$(USERLIBDIR) -Wunused-command-line-argument \
	#-Wl,-no-whole-archive -licudata -licui18n -licuio -licule -liculx -licutu -licuuc 

JSCLDFLAGS := -lpthread

INCDIR :=  \
	-I$(OWBTRUNK) \
	-I$(OWBTRUNK)/Base \
	-I$(OWBTRUNK)/Base/wtf \
	-I$(OWBGENERATEDLINK)/BAL/wtf -I$(OWBGENERATEDLINK)/BAL/wtf/text -I$(OWBGENERATEDLINK)/BAL/wtf/unicode -I$(OWBGENERATEDLINK)/BAL \
	-I$(OWBTRUNK)/JavaScriptCore \
	-I$(OWBTRUNK)/JavaScriptCore/assembler \
	-I$(OWBTRUNK)/JavaScriptCore/API \
	-I$(OWBTRUNK)/JavaScriptCore/bytecode \
	-I$(OWBTRUNK)/JavaScriptCore/bytecompiler \
	-I$(OWBTRUNK)/JavaScriptCore/debugger \
	-I$(OWBTRUNK)/JavaScriptCore/ForwardingHeaders \
	-I$(OWBTRUNK)/JavaScriptCore/interpreter \
	-I$(OWBTRUNK)/JavaScriptCore/jit \
	-I$(OWBTRUNK)/JavaScriptCore/parser \
	-I$(OWBTRUNK)/JavaScriptCore/pcre \
	-I$(OWBTRUNK)/JavaScriptCore/profiler \
	-I$(OWBTRUNK)/JavaScriptCore/runtime \
	-I$(OWBTRUNK)/JavaScriptCore/wrec \
	-I$(OWBTRUNK)/JavaScriptCore/yarr \
	-I$(OUTDIR)/JavaScriptCore \
	-I$(USERDIR)

#-I$(OWBTRUNK)/JavaScriptCore/wtf 

# WTF source files
WTFSRC := \
	$(OWBTRUNK)/BAL/Memory/WTF/BCTCSystemAllocWTF.cpp \
	$(OWBTRUNK)/BAL/Memory/WTF/BCFastMallocWTF.cpp \
	$(OWBTRUNK)/BAL/Internationalization/WTF/ICU/BCCollatorICU.cpp \
	$(OWBTRUNK)/BAL/Internationalization/WTF/BCCollatorDefaultWTF.cpp \
	$(OWBTRUNK)/BAL/Internationalization/WTF/BCUTF8WTF.cpp \
	$(OWBTRUNK)/BAL/Internationalization/WTF/Text/BCAtomicStringText.cpp \
	$(OWBTRUNK)/BAL/Internationalization/WTF/Text/BCStringImplText.cpp \
	$(OWBTRUNK)/BAL/Internationalization/WTF/Text/BCCString.cpp \
	$(OWBTRUNK)/BAL/Internationalization/WTF/Text/BCWTFStringText.cpp \
	$(OWBTRUNK)/BAL/Internationalization/WTF/Text/BCStringStaticsText.cpp \
	$(OWBTRUNK)/BAL/Types/WTF/Pthreads/BCMainThreadPthreads.cpp \
	$(OWBTRUNK)/BAL/Types/WTF/Pthreads/BCThreadIdentifierDataPthreadsPthreads.cpp \
	$(OWBTRUNK)/BAL/Types/WTF/Pthreads/BCThreadingPthreads.cpp \
	$(OWBTRUNK)/BAL/Types/WTF/BCStringExtrasWTF.cpp \
	$(OWBTRUNK)/BAL/Types/WTF/BCByteArrayWTF.cpp \
	$(OWBTRUNK)/BAL/Types/WTF/BCCurrentTimeWTF.cpp \
	$(OWBTRUNK)/BAL/Types/WTF/BCdtoaWTF.cpp \
	$(OWBTRUNK)/BAL/Types/WTF/BCRefCountedLeakCounterWTF.cpp \
	$(OWBTRUNK)/BAL/Types/WTF/BCThreadingWTF.cpp \
	$(OWBTRUNK)/BAL/Types/WTF/BCTypeTraitsWTF.cpp \
	$(OWBTRUNK)/BAL/Types/WTF/BCWTFThreadDataWTF.cpp \
	$(OWBTRUNK)/BAL/Types/WTF/BCRandomNumberWTF.cpp \
	$(OWBTRUNK)/BAL/Types/WTF/BCAssertionsWTF.cpp \
	$(OWBTRUNK)/BAL/Types/WTF/BCMainThreadWTF.cpp \
	$(OWBTRUNK)/BAL/Types/WTF/BCDateMathWTF.cpp


# source files of JSC static library
JSCSRC := \
	$(OUTDIR)/JavaScriptCore/Grammar.cpp \
	$(OWBTRUNK)/JavaScriptCore/API/JSBase.cpp \
	$(OWBTRUNK)/JavaScriptCore/API/JSCallbackConstructor.cpp  \
	$(OWBTRUNK)/JavaScriptCore/API/JSCallbackFunction.cpp \
	$(OWBTRUNK)/JavaScriptCore/API/JSCallbackObject.cpp \
	$(OWBTRUNK)/JavaScriptCore/API/JSClassRef.cpp \
	$(OWBTRUNK)/JavaScriptCore/API/JSContextRef.cpp \
	$(OWBTRUNK)/JavaScriptCore/API/JSObjectRef.cpp \
	$(OWBTRUNK)/JavaScriptCore/API/JSStringRef.cpp \
	$(OWBTRUNK)/JavaScriptCore/API/JSValueRef.cpp \
	$(OWBTRUNK)/JavaScriptCore/API/JSWeakObjectMapRefPrivate.cpp \
	$(OWBTRUNK)/JavaScriptCore/API/OpaqueJSString.cpp \
	$(OWBTRUNK)/JavaScriptCore/bytecode/CodeBlock.cpp \
	$(OWBTRUNK)/JavaScriptCore/bytecode/JumpTable.cpp \
	$(OWBTRUNK)/JavaScriptCore/bytecode/Opcode.cpp \
	$(OWBTRUNK)/JavaScriptCore/bytecode/SamplingTool.cpp \
	$(OWBTRUNK)/JavaScriptCore/bytecode/StructureStubInfo.cpp \
	$(OWBTRUNK)/JavaScriptCore/bytecompiler/BytecodeGenerator.cpp \
	$(OWBTRUNK)/JavaScriptCore/bytecompiler/NodesCodegen.cpp \
	$(OWBTRUNK)/JavaScriptCore/debugger/Debugger.cpp \
	$(OWBTRUNK)/JavaScriptCore/debugger/DebuggerActivation.cpp \
	$(OWBTRUNK)/JavaScriptCore/debugger/DebuggerCallFrame.cpp \
	$(OWBTRUNK)/JavaScriptCore/interpreter/CallFrame.cpp \
	$(OWBTRUNK)/JavaScriptCore/interpreter/Interpreter.cpp \
	$(OWBTRUNK)/JavaScriptCore/interpreter/RegisterFile.cpp \
	$(OWBTRUNK)/JavaScriptCore/jit/ExecutableAllocator.cpp \
	$(OWBTRUNK)/JavaScriptCore/jit/ExecutableAllocatorPosix.cpp \
	$(OWBTRUNK)/JavaScriptCore/jit/JIT.cpp \
	$(OWBTRUNK)/JavaScriptCore/jit/JITArithmetic.cpp \
	$(OWBTRUNK)/JavaScriptCore/jit/JITArithmetic32_64.cpp \
	$(OWBTRUNK)/JavaScriptCore/jit/JITCall.cpp \
	$(OWBTRUNK)/JavaScriptCore/jit/JITOpcodes.cpp \
	$(OWBTRUNK)/JavaScriptCore/jit/JITOpcodes32_64.cpp \
	$(OWBTRUNK)/JavaScriptCore/jit/JITPropertyAccess.cpp \
	$(OWBTRUNK)/JavaScriptCore/jit/JITPropertyAccess32_64.cpp \
	$(OWBTRUNK)/JavaScriptCore/jit/JITStubs.cpp \
	$(OWBTRUNK)/JavaScriptCore/jit/ThunkGenerators.cpp \
	$(OWBTRUNK)/JavaScriptCore/parser/Lexer.cpp \
	$(OWBTRUNK)/JavaScriptCore/parser/Nodes.cpp \
	$(OWBTRUNK)/JavaScriptCore/parser/Parser.cpp \
	$(OWBTRUNK)/JavaScriptCore/parser/ParserArena.cpp \
	$(OWBTRUNK)/JavaScriptCore/pcre/pcre_compile.cpp \
	$(OWBTRUNK)/JavaScriptCore/pcre/pcre_exec.cpp \
	$(OWBTRUNK)/JavaScriptCore/pcre/pcre_tables.cpp \
	$(OWBTRUNK)/JavaScriptCore/pcre/pcre_ucp_searchfuncs.cpp \
	$(OWBTRUNK)/JavaScriptCore/pcre/pcre_xclass.cpp \
	$(OWBTRUNK)/JavaScriptCore/profiler/Profile.cpp \
	$(OWBTRUNK)/JavaScriptCore/profiler/ProfileGenerator.cpp \
	$(OWBTRUNK)/JavaScriptCore/profiler/ProfileNode.cpp \
	$(OWBTRUNK)/JavaScriptCore/profiler/Profiler.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/ArgList.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/Arguments.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/ArrayConstructor.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/ArrayPrototype.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/BooleanConstructor.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/BooleanObject.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/BooleanPrototype.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/CallData.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/Collector.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/CommonIdentifiers.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/Completion.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/ConstructData.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/DateConstructor.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/DateConversion.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/DateInstance.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/DatePrototype.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/Error.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/ErrorConstructor.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/ErrorInstance.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/ErrorPrototype.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/ExceptionHelpers.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/Executable.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/FunctionConstructor.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/FunctionPrototype.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/GetterSetter.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/GlobalEvalFunction.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/Identifier.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/InitializeThreading.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/InternalFunction.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/JSActivation.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/JSAPIValueWrapper.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/JSArray.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/JSByteArray.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/JSCell.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/JSFunction.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/JSGlobalData.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/JSGlobalObject.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/JSGlobalObjectFunctions.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/JSImmediate.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/JSLock.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/JSNotAnObject.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/JSNumberCell.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/JSObject.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/JSONObject.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/JSPropertyNameIterator.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/JSStaticScopeObject.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/JSString.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/JSValue.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/JSVariableObject.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/JSWrapperObject.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/JSZombie.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/LiteralParser.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/Lookup.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/MathObject.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/MarkStack.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/MarkStackPosix.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/NativeErrorConstructor.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/NativeErrorPrototype.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/NumberConstructor.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/NumberObject.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/NumberPrototype.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/ObjectConstructor.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/ObjectPrototype.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/Operations.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/PropertyDescriptor.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/PropertyNameArray.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/PropertySlot.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/PrototypeFunction.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/RegExp.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/RegExpConstructor.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/RegExpObject.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/RegExpPrototype.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/RopeImpl.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/ScopeChain.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/SmallStrings.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/StringConstructor.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/StringObject.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/StringPrototype.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/Structure.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/StructureChain.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/UString.cpp \
	$(OWBTRUNK)/JavaScriptCore/runtime/TimeoutChecker.cpp \
	$(OWBTRUNK)/JavaScriptCore/yarr/RegexCompiler.cpp \
	$(OWBTRUNK)/JavaScriptCore/yarr/RegexInterpreter.cpp \
	$(OWBTRUNK)/JavaScriptCore/yarr/RegexJIT.cpp \
	$(OWBTRUNK)/JavaScriptCore/jsc.cpp



SRC := \
	$(WTFSRC) \
	$(JSCSRC) 


all: $(TARGET)

OBJS := $(patsubst %.cpp, %.o, $(SRC))

%.o: %.cpp
	@mkdir -p $(dir $@)
	$(CX) $(DEFINES) $(CXFLAGS) $(INCDIR) $(LDFLAGS) -c -o $@ $^ 

.jsc_files:
	mkdir -p $(OUTDIR)/JavaScriptCore
	sh create_link.sh
	#+++++ walk around solution start +++++
	# bison3 is incompatible with bison2 ( http://savannah.gnu.org/forum/forum.php?forum_id=7663 )
	#bison -d -p jscyy JavaScriptCore/parser/Grammar.y -o $(OUTDIR)/JavaScriptCore/Grammar.tab.c && mv -f $(OUTDIR)/JavaScriptCore/Grammar.tab.c $(OUTDIR)/JavaScriptCore/Grammar.cpp && mv -f $(OUTDIR)/JavaScriptCore/Grammar.tab.h $(OUTDIR)/JavaScriptCore/Grammar.h
	cp -fv doc/bison_grammar_src/* $(OUTDIR)/JavaScriptCore/ 
	#+++++ walk around solution end +++++
	perl JavaScriptCore/pcre/dftables $(OUTDIR)/JavaScriptCore/chartables.c
	python JavaScriptCore/create_regex_tables > $(OUTDIR)/JavaScriptCore/RegExpJitTables.h
	perl $(JSCDIR)/create_hash_table $(JSCDIR)/runtime/JSONObject.cpp -i > $(OUTDIR)/JavaScriptCore/JSONObject.lut.h
	perl $(JSCDIR)/create_hash_table $(JSCDIR)/runtime/ArrayPrototype.cpp -i > $(OUTDIR)/JavaScriptCore/ArrayPrototype.lut.h
	perl $(JSCDIR)/create_hash_table $(JSCDIR)/runtime/DatePrototype.cpp -i > $(OUTDIR)/JavaScriptCore/DatePrototype.lut.h
	perl $(JSCDIR)/create_hash_table $(JSCDIR)/parser/Keywords.table -i > $(OUTDIR)/JavaScriptCore/Lexer.lut.h
	perl $(JSCDIR)/create_hash_table $(JSCDIR)/runtime/MathObject.cpp -i > $(OUTDIR)/JavaScriptCore/MathObject.lut.h
	perl $(JSCDIR)/create_hash_table $(JSCDIR)/runtime/NumberConstructor.cpp -i > $(OUTDIR)/JavaScriptCore/NumberConstructor.lut.h
	perl $(JSCDIR)/create_hash_table $(JSCDIR)/runtime/RegExpConstructor.cpp -i > $(OUTDIR)/JavaScriptCore/RegExpConstructor.lut.h
	perl $(JSCDIR)/create_hash_table $(JSCDIR)/runtime/RegExpObject.cpp -i > $(OUTDIR)/JavaScriptCore/RegExpObject.lut.h
	perl $(JSCDIR)/create_hash_table $(JSCDIR)/runtime/StringPrototype.cpp -i > $(OUTDIR)/JavaScriptCore/StringPrototype.lut.h
	touch $@


$(TARGET): .jsc_files $(OBJS)
	#$(LD) $(CXFLAGS) $(OBJS) -o $@ $(JSCLDFLAGS) 
	$(LD) $(OBJS) -o $@ $(JSCLDFLAGS) 

dep: .jsc_files

clean:
	rm -rf $(TARGET)
	rm -rf $(OBJS)

dist-clean: clean
	rm -rf $(OUTDIR) .jsc_files

.PHONY: dist-clean clean dep

