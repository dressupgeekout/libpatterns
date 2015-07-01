.PHONY: all install install-man install-static install-shared clean
.SUFFIXES: .c .o

LIBDIR= $(DESTDIR)$(PREFIX)/lib
MANDIR= $(DESTDIR)$(PREFIX)/man/man7

OBJS= libpatterns.a libpatterns.so

all: $(OBJS)

.c.o:
	$(CC) $(CFLAGS) -c -o $(.TARGET) $(.ALLSRC)

libpatterns.a: patterns.o
	ar crs $(.TARGET) $(.ALLSRC)

libpatterns.so: patterns.o
	$(CC) -shared -fPIC -o $(.TARGET) $(.ALLSRC)

install: install-man install-static install-shared

install-man:
	install -d $(MANDIR)
	install patterns.7 $(MANDIR)

install-static:
	install -d $(LIBDIR)
	install libpatterns.a $(LIBDIR)

install-shared:
	install -d $(LIBDIR)
	install libpatterns.so $(LIBDIR)

clean:
	rm -f $(OBJS) *.o
