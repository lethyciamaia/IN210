CXX = gcc

LDFLAGS = -lgcov --coverage
OPTION = -Wall -fexceptions -fprofile-arcs -ftest-coverage
INCS = -I.  -I"."
OBJS = $(SRC:.c=.o)

SRC = ratp.c  main.c cmocka.c


all: $(OBJS)
	$(CXX) $(LDFLAGS) $(INCS) -L "C:\\cmocka\\lib"  -o testAll  $(OBJS)


exec : all
	testAll.exe
%.o: %.c
	$(CXX) $(OPTION)  -c  $< -o $@ $(INCS)

clean:
	del $(OBJS)


mrproper: clean
	del testAll.exe
	del result.xml
    
