.PHONY: build run debug clean

build:
	@crystal compile server.cr

run:
	@crystal run server.cr

clean:
	rm server
