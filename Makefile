# libpatterns Makefile
# Charlotte Koch <cfkoch@edgebsd.org>

LIBDIR?=	${DESTDIR}${PREFIX}/lib
MANDIR?=	${DESTDIR}${PREFIX}/man/man7
INCLUDEDIR?=	${DESTDIR}${PREFIX}/include

OBJS= libpatterns.a libpatterns.so

.PHONY: all
all: ${OBJS}

.SUFFIXES: .c .o
.c.o:
	${CC} ${CPPFLAGS} ${CFLAGS} -c -fPIC -o ${.TARGET} ${.ALLSRC}

libpatterns.a: patterns.o
	${AR} crs ${.TARGET} ${.ALLSRC}

libpatterns.so: patterns.o
	${CC} -shared -o ${.TARGET} ${LDFLAGS} ${.ALLSRC}

.PHONY: install
install: install-man install-headers install-static install-shared

.PHONY: install-man
install-man:
	install -d ${MANDIR}
	install -m0644 patterns.7 ${MANDIR}

.PHONY: install-headers
install-headers:
	install -d ${INCLUDEDIR}
	install -m0644 patterns.h ${INCLUDEDIR}

.PHONY: install-static
install-static:
	install -d ${LIBDIR}
	install -m0644 libpatterns.a ${LIBDIR}

.PHONY: install-shared
install-shared:
	install -d ${LIBDIR}
	install -m0755 libpatterns.so ${LIBDIR}

.PHONY: clean
clean:
	rm -f ${OBJS} *.o *.core
