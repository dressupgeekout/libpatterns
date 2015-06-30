# libpatterns

**libpatterns** is a small, embeddable C library which gives your program a
pretty decent regular expression engine. You can think of it as PCRE on a
diet.

This library is essentially just a redistribution of the code from
patterns(7) from OpenBSD's httpd(8), which in turn is based on the
pattern-matching code from the Lua language.


## Author

The pattern matching is derived from the original implementation of the Lua
scripting language written by Roberto Ierusalimschy, Waldemar Celes, and
Luiz Henrique de Figueiredo at PUC-Rio. It was turned into a native C API
for OpenBSD's httpd(8) by Reyk Floeter. That native C API was repackaged as
a system-wide library by Christian Koch <cfkoch@sdf.lonestar.org>


## License

This library is released under a 2-clause BSD-style license, but it is
mainly a redistribution of code licensed under a MIT-style license and an
ISC-style license. See the LICENSE document for details.
