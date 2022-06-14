.PHONY: clean
.SUFFIXES: .c .o .a .so

.c.o:
	gcc -c $<
.o:
	gcc -o $@ $^

lib%.a: lib%.o
	ar rs $@ $<
lib%.so: lib%.o
	gcc -shared -o $@ $<
lib%.o: %.c
	gcc -fPIC -c $< -o $@ 
%: %.o lib%.a lib%.so
	gcc -o $@ $^

all: code2
install:
        sudo apt update
        sudo apt install gcc



code2: code2.o libsquare.a libcube.so 

libcube.o: cube.c
libsquare.o: square.c

libsquare.a: libsquare.o
libcube.so: libcube.o

# Pliki „z falka” na koncu nazwy tworzone sa czesto przez edytory
# tekstów, które w ten sposób zapisuja poprzednie wersje pliku (przed
# zapisaniem biezcych zmian).
clean: 
	rm -f code2 *.o *.a *.so *~ *.out




