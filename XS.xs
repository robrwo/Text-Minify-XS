#define PERL_NO_GET_CONTEXT // we'll define thread context if necessary (faster)
#include "EXTERN.h"         // globals/constant import locations
#include "perl.h"           // Perl symbols, structures and constants definition
#include "XSUB.h"           // xsubpp functions and macros

#include <string.h>
#include <stdlib.h>

#define isEOL(c) ((c == '\n') || (c == '\r') || (c == '\f') || (c == '\v') || (c == 0x85))

#define isWhitespace(c) ((c == ' ') || (c == '\t') || isEOL(c))

char* TextMinify(const char* inStr) {
  size_t len   = strlen(inStr);
  char* outStr;

  Newx(outStr, len, char);

  if (!outStr) /* malloc failed */
    return outStr;

  char* ptr = outStr;
  char* leading = ptr;
  char* trailing = NULL;

  while (*inStr) {
    char c = *inStr;

    if (leading && !isWhitespace(c))
        leading = NULL;

    if (!leading) {
      if (isEOL(c)) {
        if (trailing) {
          ptr = trailing;
        }
        if (c == '\r') c = '\n'; /* Normalise CR+LF */
        leading = ptr;
      }
      else if (isWhitespace(c)) {
        if (!trailing) trailing = ptr;
      }
      else {
        trailing = NULL;
      }
      *ptr++ = c;
    }

    inStr++;
  }

  if (trailing) {
    ptr = trailing;
    if (isEOL(*ptr)) ptr++;
  }

  *ptr = '\0';

  return outStr;
}

MODULE = Text::Minify::XS PACKAGE = Text::Minify::XS

PROTOTYPES: ENABLE

SV*
minify(inStr)
  SV* inStr
  INIT:
    char* outStr = NULL;
    RETVAL = &PL_sv_undef;
  CODE:
    U32 is_utf8 = SvUTF8(inStr);
    outStr = TextMinify( SvPVX(inStr) );
    if (outStr != NULL) {
      SV* result = newSVpv(outStr, 0);
      if (is_utf8) SvUTF8_on(result);
      RETVAL = result;
      Safefree(outStr);
    }
  OUTPUT:
    RETVAL
