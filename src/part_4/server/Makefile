CC = gcc
CFLAGS = -Wall -Werror -Wextra
LIBS = -lfcgi

TARGET = server
SRC_FILES = $(TARGET).c
OBJ_FILES = $(SRC_FILES:.c=.o)

all: build

build: $(OBJ_FILES)
	$(CC) $(CFLAGS) $< -o $(TARGET) $(LIBS)

$(OBJ_FILES): $(SRC_FILES)
	$(CC) $(CFLAGS) -c $< -o $@ $(LIBS)

clean:
	rm $(TARGET) *.o

rebuild: clean build

.PHONY: all build clean rebuild



