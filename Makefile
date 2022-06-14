all: code2

install:
        sudo apt update
        sudo apt install gcc

code2: code2.c libsquare.a libcube.so
	gcc -o $@ $^ 

libcube.o: cube.c
	gcc -fPIC -c $< -o $@

libsquare.o: square.c
	gcc -c $< -o $@ 

libsquare.a: libsquare.o
	ar rs $@ $<

libcube.so: libcube.o
	gcc -shared -o $@ $<

clean: 
	rm -f code2 *.o *.a *.so *~ *.out




