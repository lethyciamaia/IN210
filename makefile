CC = gcc
CFLAGS = -I. -Wall -Werror -fexceptions -fprofile-arcs -ftest-coverage
LDFLAGS = -lcmocka --coverage

SRCS = ratp.c main.c 
OBJS = $(SRCS:.c=.o)

all: testAll

testAll: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS) $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@ -fprofile-arcs -ftest-coverage

clean:
	rm -f $(OBJS) testAll

mrproper:  clean
	rm -f ratp.g*
	rm -f main.g*
	rm -f result.*
