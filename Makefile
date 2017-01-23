# libpatterns Makefile
# Charlotte Koch <cfkoch@edgebsd.org>

LIBDIR?= ${DESTDIR}${PREFIX}/lib
MANDIR?= ${DESTDIR}${PREFIX}/man/man7

OBJS= libpatterns.a libpatterns.so

.PHONY: all
all: ${OBJS}

.SUFFIXES: .c .o
.c.o:
	${CC} ${CFLAGS} -c -fPIC -o ${.TARGET} ${.ALLSRC}

libpatterns.a: patterns.o
	ar crs ${.TARGET} ${.ALLSRC}

libpatterns.so: patterns.o
	${CC} -shared -o ${.TARGET} ${.ALLSRC}

.PHONY: install
install: install-man install-static install-shared

.PHONY: install-man
install-man:
	install -d ${MANDIR}
	install patterns.7 ${MANDIR}

.PHONY: install-static
install-static:
	install -d ${LIBDIR}
	install -m0755 libpatterns.a ${LIBDIR}

.PHONY: install-shared
install-shared:
	install -d ${LIBDIR}
	install -m0755 libpatterns.so ${LIBDIR}

.PHONY: clean
clean:
	rm -f ${OBJS} *.o *.core
