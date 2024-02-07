CC=arm-none-eabi-gcc
CFLAGS= -c -Wall -O0

all: add_with_carry.o n_factorial.o sub_with_borrow.o odd_even.o

add_with_carry.o: add_with_carry.s
	$(CC) $(CFLAGS) $^ -o $@


n_factorial.o: n_factorial.s
	$(CC) $(CFLAGS) $^ -o $@


sub_with_borrow.o: sub_with_borrow.s
	$(CC) $(CFLAGS) $^ -o $@


odd_even.o: odd_even.s
	$(CC) $(CFLAGS) $^ -o $@

clean:
	rm -rf *.o
