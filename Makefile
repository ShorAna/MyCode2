all: code2

install: 
	sudo apt update
	sudo apt install gcc

code2: code2.c libsquare.a libcube.so
	gcc -o code2 code2.c libsquare.a libcube.so 

libcube.o: cube.c
	gcc -fPIC -c cube.c -o libcube.o 

libsquare.o: square.c
	gcc -c square.c -o libsquare.o 

libsquare.a: libsquare.o
	ar rs libsquare.a libsquare.o

libcube.so: libcube.o
	gcc -shared -o libcube.so libcube.o


clean: 
	rm -f code2 *.o *.a *.so *~ *.out




