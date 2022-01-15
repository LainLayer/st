# st version
VERSION = 0.8.5


# Autism
PKG_CONFIG = pkg-config
MLIBS = `$(PKG_CONFIG) --libs   fontconfig freetype2 harfbuzz`
MINCS = `$(PKG_CONFIG) --cflags fontconfig freetype2 harfbuzz`



# paths
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man

X11INC = /usr/X11R6/include
X11LIB = /usr/X11R6/lib


# includes and libs
INCS = -I$(X11INC) $(MINCS)
LIBS = -L$(X11LIB) -lm -lrt -lX11 -lutil -lXft -lXrender $(MLIBS)

CC=clang
CFLAGS  = -O3 -march=native --std=c11 -ffast-math -flto
LDFLAGS = --ld-path=/usr/bin/ld.lld -O3


# flags
STCPPFLAGS = -DVERSION=\"$(VERSION)\" -D_XOPEN_SOURCE=600 -O3
STCFLAGS = $(INCS) $(STCPPFLAGS) $(CPPFLAGS) $(CFLAGS)
STLDFLAGS = $(LIBS) $(LDFLAGS)
