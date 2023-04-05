CFLAGS=-Wall -Wextra -g -lm
LIB=libubint.so

SOURCE_DIR=src
INSTALL_DIR=/usr/lib64

all: $(LIB) test

$(LIB): $(SOURCE_DIR)/*.c
	$(CC) $(CFLAGS) -fPIC -shared $^ -lc -o $@

test: *.c
	$(CC) $(CFLAGS) -L. -lubint $^ -o $@

clean:
	rm -f *.o *.so
	rm -f test

install:
	cp $(LIB) $(INSTALL_DIR)

uninstall:
	rm -f $(INSTALL_DIR)/$(LIB)
