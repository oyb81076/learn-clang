.PHYON: main clean
main: build/main.o
	./build/main.o
clean:
	rm -rf build;
build/main.o: build
	gcc src/main.c -o build/main.o;
build:
	mkdir -p build;
