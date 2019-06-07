
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

#include <stdio.h>
#include "unicode/utypes.h"
#include "unicode/uchar.h"
#include "unicode/locid.h"
#include "unicode/ustring.h"
#include "unicode/ucnv.h"
#include "unicode/unistr.h"

#define LENGTHOF(array) (sizeof(array)/sizeof((array)[0]))

static void
printUString(const char *announce, const UChar *s, int32_t length) {
    static char out[200];
    UChar32 c;
    int32_t i;
    UErrorCode errorCode=U_ZERO_ERROR;

    /*
     * Convert to the "platform encoding". See notes in printUnicodeString().
     * ucnv_fromUChars(), like most ICU APIs understands length==-1
     * to mean that the string is NUL-terminated.
     */
    ucnv_fromUChars(cnv, out, sizeof(out), s, length, &errorCode);
    if(U_FAILURE(errorCode) || errorCode==U_STRING_NOT_TERMINATED_WARNING) {
        printf("%sproblem converting string from Unicode: %s\n", announce, u_errorName(errorCode));
        return;
    }

    printf("%s%s {", announce, out);

    /* output the code points (not code units) */
    if(length>=0) {
        /* s is not NUL-terminated */
        for(i=0; i<length; /* U16_NEXT post-increments */) {
            U16_NEXT(s, i, length, c);
            printf(" %04x", c);
        }
    } else {
        /* s is NUL-terminated */
        for(i=0; /* condition in loop body */; /* U16_NEXT post-increments */) {
            U16_NEXT(s, i, length, c);
            if(c==0) {
                break;
            }
            printf(" %04x", c);
        }
    }
    printf(" }\n");
}

void 
demo_strTo()	{
    /*
     * input=
     *   "aB<capital sigma>"
     *   "iI<small dotless i><capital dotted I> "
     *   "<sharp s> <small lig. ffi>"
     *   "<small final sigma><small sigma><capital sigma>"
     */
    static const UChar input[]={
        0x61, 0x42, 0x3a3,
        0x69, 0x49, 0x131, 0x130, 0x20,
        0xdf, 0x20, 0xfb03,
        0x3c2, 0x3c3, 0x3a3, 0
    };
    UChar buffer[32];

    UErrorCode errorCode;
    UChar32 c;
    int32_t i, j, length;
    UBool isError;

    errorCode = U_ZERO_ERROR;
    length = u_strToLower(buffer, LENGTHOF(buffer), input, -1, "en", &errorCode);
    if(U_SUCCESS(errorCode)) {
        printUString("full-lowercased/en: ", buffer, length);
    } else {
        printf("error in u_strToLower(en)=%ld error=%s\n", length, u_errorName(errorCode));
    }
}

static void demoCaseMapInC() {
    /*
     * input=
     *   "aB<capital sigma>"
     *   "iI<small dotless i><capital dotted I> "
     *   "<sharp s> <small lig. ffi>"
     *   "<small final sigma><small sigma><capital sigma>"
     */
    static const UChar input[]={
        0x61, 0x42, 0x3a3,
        0x69, 0x49, 0x131, 0x130, 0x20,
        0xdf, 0x20, 0xfb03,
        0x3c2, 0x3c3, 0x3a3, 0
    };
    UChar buffer[32];

    UErrorCode errorCode;
    UChar32 c;
    int32_t i, j, length;
    UBool isError;

    printf("\n* demoCaseMapInC() ----------------- ***\n\n");

    /*
     * First, use simple case mapping functions which provide
     * 1:1 code point mappings without context/locale ID.
     *
     * Note that some mappings will not be "right" because some "real"
     * case mappings require context, depend on the locale ID,
     * and/or result in a change in the number of code points.
     */
    printUString("input string: ", input, -1);

    /* uppercase */
    isError=FALSE;
    for(i=j=0; j<LENGTHOF(buffer) && !isError; /* U16_NEXT post-increments */) {
        U16_NEXT(input, i, INT32_MAX, c); /* without length because NUL-terminated */
        if(c==0) {
            break; /* stop at terminating NUL, no need to terminate buffer */
        }
        c=u_toupper(c);
        U16_APPEND(buffer, j, LENGTHOF(buffer), c, isError);
    }
    printUString("simple-uppercased: ", buffer, j);
    /* lowercase */
    isError=FALSE;
    for(i=j=0; j<LENGTHOF(buffer) && !isError; /* U16_NEXT post-increments */) {
        U16_NEXT(input, i, INT32_MAX, c); /* without length because NUL-terminated */
        if(c==0) {
            break; /* stop at terminating NUL, no need to terminate buffer */
        }
        c=u_tolower(c);
        U16_APPEND(buffer, j, LENGTHOF(buffer), c, isError);
    }
    printUString("simple-lowercased: ", buffer, j);
    /* titlecase */
    isError=FALSE;
    for(i=j=0; j<LENGTHOF(buffer) && !isError; /* U16_NEXT post-increments */) {
        U16_NEXT(input, i, INT32_MAX, c); /* without length because NUL-terminated */
        if(c==0) {
            break; /* stop at terminating NUL, no need to terminate buffer */
        }
        c=u_totitle(c);
        U16_APPEND(buffer, j, LENGTHOF(buffer), c, isError);
    }
    printUString("simple-titlecased: ", buffer, j);
    /* case-fold/default */
    isError=FALSE;
    for(i=j=0; j<LENGTHOF(buffer) && !isError; /* U16_NEXT post-increments */) {
        U16_NEXT(input, i, INT32_MAX, c); /* without length because NUL-terminated */
        if(c==0) {
            break; /* stop at terminating NUL, no need to terminate buffer */
        }
        c=u_foldCase(c, U_FOLD_CASE_DEFAULT);
        U16_APPEND(buffer, j, LENGTHOF(buffer), c, isError);
    }
    printUString("simple-case-folded/default: ", buffer, j);
    /* case-fold/Turkic */
    isError=FALSE;
    for(i=j=0; j<LENGTHOF(buffer) && !isError; /* U16_NEXT post-increments */) {
        U16_NEXT(input, i, INT32_MAX, c); /* without length because NUL-terminated */
        if(c==0) {
            break; /* stop at terminating NUL, no need to terminate buffer */
        }
        c=u_foldCase(c, U_FOLD_CASE_EXCLUDE_SPECIAL_I);
        U16_APPEND(buffer, j, LENGTHOF(buffer), c, isError);
    }
    printUString("simple-case-folded/Turkic: ", buffer, j);

    /*
     * Second, use full case mapping functions which provide
     * 1:n code point mappings (n can be 0!) and are sensitive to context and locale ID.
     *
     * Note that lower/upper/titlecasing take a locale ID while case-folding
     * has bit flag options instead, by design of the Unicode SpecialCasing.txt UCD file.
     *
     * Also, string titlecasing requires a BreakIterator to find starts of words.
     * The sample code here passes in a NULL pointer; u_strToTitle() will open and close a default
     * titlecasing BreakIterator automatically.
     * For production code where many strings are titlecased it would be more efficient
     * to open a BreakIterator externally and pass it in.
     */
    printUString("\ninput string: ", input, -1);

    /* lowercase/English */
    errorCode=U_ZERO_ERROR;
    length=u_strToLower(buffer, LENGTHOF(buffer), input, -1, "en", &errorCode);
    if(U_SUCCESS(errorCode)) {
        printUString("full-lowercased/en: ", buffer, length);
    } else {
        printf("error in u_strToLower(en)=%ld error=%s\n", length, u_errorName(errorCode));
    }
    /* lowercase/Turkish */
    errorCode=U_ZERO_ERROR;
    length=u_strToLower(buffer, LENGTHOF(buffer), input, -1, "tr", &errorCode);
    if(U_SUCCESS(errorCode)) {
        printUString("full-lowercased/tr: ", buffer, length);
    } else {
        printf("error in u_strToLower(tr)=%ld error=%s\n", length, u_errorName(errorCode));
    }
    /* uppercase/English */
    errorCode=U_ZERO_ERROR;
    length=u_strToUpper(buffer, LENGTHOF(buffer), input, -1, "en", &errorCode);
    if(U_SUCCESS(errorCode)) {
        printUString("full-uppercased/en: ", buffer, length);
    } else {
        printf("error in u_strToUpper(en)=%ld error=%s\n", length, u_errorName(errorCode));
    }
    /* uppercase/Turkish */
    errorCode=U_ZERO_ERROR;
    length=u_strToUpper(buffer, LENGTHOF(buffer), input, -1, "tr", &errorCode);
    if(U_SUCCESS(errorCode)) {
        printUString("full-uppercased/tr: ", buffer, length);
    } else {
        printf("error in u_strToUpper(tr)=%ld error=%s\n", length, u_errorName(errorCode));
    }
    /* titlecase/English */
    errorCode=U_ZERO_ERROR;
    length=u_strToTitle(buffer, LENGTHOF(buffer), input, -1, NULL, "en", &errorCode);
    if(U_SUCCESS(errorCode)) {
        printUString("full-titlecased/en: ", buffer, length);
    } else {
        printf("error in u_strToTitle(en)=%ld error=%s\n", length, u_errorName(errorCode));
    }
    /* titlecase/Turkish */
    errorCode=U_ZERO_ERROR;
    length=u_strToTitle(buffer, LENGTHOF(buffer), input, -1, NULL, "tr", &errorCode);
    if(U_SUCCESS(errorCode)) {
        printUString("full-titlecased/tr: ", buffer, length);
    } else {
        printf("error in u_strToTitle(tr)=%ld error=%s\n", length, u_errorName(errorCode));
    }
    /* case-fold/default */
    errorCode=U_ZERO_ERROR;
    length=u_strFoldCase(buffer, LENGTHOF(buffer), input, -1, U_FOLD_CASE_DEFAULT, &errorCode);
    if(U_SUCCESS(errorCode)) {
        printUString("full-case-folded/default: ", buffer, length);
    } else {
        printf("error in u_strFoldCase(default)=%ld error=%s\n", length, u_errorName(errorCode));
    }
    /* case-fold/Turkic */
    errorCode=U_ZERO_ERROR;
    length=u_strFoldCase(buffer, LENGTHOF(buffer), input, -1, U_FOLD_CASE_EXCLUDE_SPECIAL_I, &errorCode);
    if(U_SUCCESS(errorCode)) {
        printUString("full-case-folded/Turkic: ", buffer, length);
    } else {
        printf("error in u_strFoldCase(Turkic)=%ld error=%s\n", length, u_errorName(errorCode));
    }
}




int
main(int argc, const char *argv[]) {
	demo_strTo();
	demoCaseMapInC();
    return 0;
}

