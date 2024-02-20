CC=arm-none-eabi-as
CFLAGS=-Wall

add_with_carry: add_with_carry.s
	$(CC) $(CFLAGS) $^ -o $@


n_factorial: n_factorial.s
	$(CC) $(CFLAGS) $^ -o $@


sub_with_borrow: sub_with_borrow.s
	$(CC) $(CFLAGS) $^ -o $@


odd_even: odd_even.s
	$(CC) $(CFLAGS) $^ -o $@

clean:
	rm -rf *.o
