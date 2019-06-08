
/*  
// https://stackoverflow.com/questions/6010793/looking-for-simple-practical-c-examples-of-how-to-use-icu

#include <fstream>
#include <string>
#include <unicode/unistr.h>

int main(int argc, char** argv) {
    std::ifstream f("utf.txt");
    std::string s;
    while (std::getline(f, s)) {
        // at this point s contains a line of text
        // which may be ANSI or UTF-8 encoded

        // convert std::string to ICU's UnicodeString
        UnicodeString ucs = UnicodeString::fromUTF8(StringPiece(s.c_str()));

        // convert UnicodeString to std::wstring
        std::wstring ws;
        for (int i = 0; i < ucs.length(); ++i)
            ws += static_cast<wchar_t>(ucs[i]);
    }
}
*/



// refer to cstrcase.c

#include <stdio.h>
#include <string.h>
#include "unicode/utypes.h"
#include "unicode/uchar.h"
#include "unicode/ustring.h"
#include "unicode/uloc.h"
#include "unicode/ubrk.h"
#include "unicode/ucasemap.h"

void
test_u_memcasecmp()	{
    static const UChar

    mixed[]=               { 0x61, 0x42, 0x131, 0x3a3, 0xdf,       0xfb03,           0xd93f, 0xdfff, 0 },
    otherDefault[]=        { 0x41, 0x62, 0x131, 0x3c3, 0x73, 0x53, 0x46, 0x66, 0x49, 0xd93f, 0xdfff, 0 },
    otherExcludeSpecialI[]={ 0x41, 0x62, 0x131, 0x3c3, 0x53, 0x73, 0x66, 0x46, 0x69, 0xd93f, 0xdfff, 0 },
    different[]=           { 0x41, 0x62, 0x131, 0x3c3, 0x73, 0x53, 0x46, 0x66, 0x49, 0xd93f, 0xdffd, 0 };

    int32_t result;

    /* test u_memcasecmp() - stop before the sharp s (U+00df) */
    result=u_memcasecmp(mixed, different, 4, U_FOLD_CASE_DEFAULT);
    if(result!=0) {
        printf ("error: u_memcasecmp(mixed, different, 4, default)=%ld instead of 0\n", result);
    }
	printf ("u_memcasecmp test-1 result=%ld.\n", result);

    /* test u_memcasecmp() - stop in the middle of the sharp s (U+00df) */
    result=u_memcasecmp(mixed, different, 5, U_FOLD_CASE_DEFAULT);
    if(result<=0) {
        printf ("error: u_memcasecmp(mixed, different, 5, default)=%ld instead of positive\n", result);
    }
	printf ("u_memcasecmp test-2 result=%ld.\n", result);
}


int
main(int argc, const char *argv[]) {
	test_u_memcasecmp();
    return 0;
}

