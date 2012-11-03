
CPPFLAGS += -Icompat -D__Linux26__

C := $(wildcard *.c) $(wildcard compat/*/*.c) $(wildcard compat/*.c)
O := $(patsubst %.c,%.o,$C)
M := $(shell uname -m)


# Machine-dependant sources
ifeq ($M,x86_64)
O += compat/lib9/md/getcallerpc-$M.o
endif


9pfuse: $O -lfuse -lpthread
	$(CC) $(LDFLAGS) -o $@ $^

clean:
	$(RM) 9pfuse $O

