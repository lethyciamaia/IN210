CC = gcc
CFLAGS = -I. -Wall -Werror -fexceptions -fprofile-arcs -ftest-coverage
LDFLAGS = -lcmocka --coverage

SRCS = ratp.c main.c 
OBJS = $(SRCS:.c=.o)

all: testAll.exe

testAll.exe: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS) $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@ -fprofile-arcs -ftest-coverage

clean:
	del /Q $(OBJS) testAll.exe

mrproper:  clean
	del /Q ratp.g*
	del /Q main.g*
	del /Q result.*
