.PHONY: all install clean 
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
	$(CC) -shared -o $(.TARGET) $(.ALLSRC)

install:
	install -d $(LIBDIR)
	install -d $(MANDIR)
	install libpatterns.a $(LIBDIR)
	install libpatterns.so $(LIBDIR)
	install patterns.7 $(MANDIR)

clean:
	rm -f $(OBJS) *.o
