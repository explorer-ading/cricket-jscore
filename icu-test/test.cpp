
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

