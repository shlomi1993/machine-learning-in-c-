CC = g++
INCLUDE_DIR := $(MNIST_ML_ROOT)/include
SRC := $(MNIST_ML_ROOT)/src
CFLAGS := -std=c++11 -g
LIB_DATA := libdata.so

all: $(LIB_DATA) main.out

$(LIB_DATA): libdir objdir obj/data_handler.o obj/data.o
	$(CC) $(CFLAGS) -shared -o $(MNIST_ML_ROOT)/lib/$(LIB_DATA) obj/*.o
	rm -r $(MNIST_ML_ROOT)/obj

libdir:
	mkdir -p $(MNIST_ML_ROOT)/lib

objdir:
	mkdir -p $(MNIST_ML_ROOT)/obj

bindir:
	mkdir -p $(MNIST_ML_ROOT)/bin

obj/data_handler.o: $(SRC)/data_handler.cc
	$(CC) -fPIC $(CFLAGS) -o obj/data_handler.o -I$(INCLUDE_DIR) -c $(SRC)/data_handler.cc

obj/data.o: $(SRC)/data.cc
	$(CC) -fPIC $(CFLAGS) -o obj/data.o -I$(INCLUDE_DIR) -c $(SRC)/data.cc

main: bindir $(MNIST_ML_ROOT)/main.cc $(LIB_DATA)
	$(CC) -fPIC $(CFLAGS) -o $(MNIST_ML_ROOT)/main.out $(MNIST_ML_ROOT)/main.cc -I$(INCLUDE_DIR) -L$(MNIST_ML_ROOT)/lib -ldata

clean:
	rm -r $(MNIST_ML_ROOT)/lib
	rm -r $(MNIST_ML_ROOT)/obj
	rm -f $(MNIST_ML_ROOT)/main.out
