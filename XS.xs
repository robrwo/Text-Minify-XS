#define PERL_NO_GET_CONTEXT // we'll define thread context if necessary (faster)
#include "EXTERN.h"         // globals/constant import locations
#include "perl.h"           // Perl symbols, structures and constants definition
#include "XSUB.h"           // xsubpp functions and macros

#include <string.h>
#include <stdlib.h>

int isEOL(char c) {
  if ((c == '\n') || (c == '\r') || (c == '\f') || (c == '\v') || (c == 0x85))
    return 1;
  return 0;
}

int isWhitespace(char c) {
  if ((c == ' ') || (c == '\t') || isEOL(c))
    return 1;
  return 0;
}


char* TextMinify(const char* inStr) {
  size_t len   = strlen(inStr);
  char* outStr = malloc(len);

  if (!outStr) // malloc failed
    return outStr;

  char* ptr = outStr;
  char* leading = ptr;

  while (*inStr) {
    char c = *inStr;

    if (leading && !isWhitespace(c))
        leading = NULL;

    if (!leading) {
      *ptr = c;
      if (isEOL(c)) leading = ptr;
      ptr++;
    }

    inStr++;
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
    outStr = TextMinify( SvPVX(inStr) );
    if (outStr != NULL) {
      RETVAL = newSVpv(outStr, 0);
      Safefree(outStr);
    }
  OUTPUT:
    RETVAL
