CC = cc
CFLAGS = -g

PROGS = code2 

.PHONY: clean
.SUFFIXES: .c .o .a .so

.c.o:
	$(CC) $(CFLAGS) -c $<
.o:
	$(CC) $(CFLAGS) -o $@ $^

lib%.a: lib%.o
	$(AR) rsc $@ $<
lib%.so: lib%.o
	$(CC) $(CFLAGS) -shared -o $@ $<
lib%.o: %.c
	$(CC) $(CFLAGS) -fPIC -c $< -o $@ 
%: %.o lib%.a lib%.so
	$(CC) $(CFLAGS) -o $@ $^

all: $(PROGS)
install: 
	sudo apt update
	sudo apt install gcc

code2: code2.o libsquare.a libcube.so 

libcube.o: cube.c
libsquare.o: square.c

libsquare.a: libsquare.o
libcube.so: libcube.o

clean: 
	$(RM) $(PROGS) *.o *.a *.so *~ *.out




