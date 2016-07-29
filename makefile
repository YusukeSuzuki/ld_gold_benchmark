target=goldtest

sources= sources/main.cpp $(wildcard sources/*.function.cpp)
objects= $(patsubst %.cpp,%.o,$(sources))

GOLD=

CXXFLAGS=-std=c++11
LDFLAGS=-lstdc++ $(GOLD)

all: $(target)

$(target): $(objects)
	$(CC) -o $@ $^ $(LDFLAGS)

objs: $(objects)

src: $(sources)

$(sources):
	cd sources; python3 create.py

.PHONY: clean all

clean: 
	rm -rf $(target)
	rm -rf $(objects)
	rm -f sources/*.cpp sources/*.o

