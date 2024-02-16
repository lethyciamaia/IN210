CXX = gcc
LDFLAGS = --coverage
OPTION = -Wall -fexceptions -fprofile-arcs -ftest-coverage

INCS = -I.  -I"." 
OBJS = $(SRC:.c=.o)

SRC = ratp.c  main.c cmocka.o

all: $(OBJS)
	$(CXX) $(LDFLAGS) $(OPTION) $(INCS) -o testAll  $(OBJS)
	
exec : all
	./testAll
%.o: %.c
	$(CXX) $(OPTION) -c  $< -o $@ $(INCS)
	
clean:
	rm $(OBJS) 

mrproper: clean
	rm ratp.g*
	rm main.g*
	rm testAll
	rm result.*

testcoverage:
	gcov -b -c ratp.c
	/Users/lethyciamaia/anaconda3/lib/python3.11/site-packages/gcovr --cobertura toto.xml -f ratp.c
