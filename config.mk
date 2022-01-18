# st version
VERSION = 0.8.5

# autism
PKG_CONFIG = pkg-config
MLIBS = `$(PKG_CONFIG) --libs   fontconfig freetype2 harfbuzz`
MINCS = `$(PKG_CONFIG) --cflags fontconfig freetype2 harfbuzz`

# paths
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man

# X11
X11INC = /usr/X11R6/include
X11LIB = /usr/X11R6/lib

# includes and libs
INCS = -I$(X11INC) $(MINCS)
LIBS = -L$(X11LIB) -lm -lrt -lX11 -lutil -lXft -lXrender $(MLIBS)

# profiling

MODE      = NONE
PROF_GEN  = -fprofile-instr-generate
RPOF_RES  = -fprofile-instr-use=code.profdata
PROF_NONE =""

# custom flags

SANITIZE = -fsanitize=address -fsanitize=integer -fsanitize=shift

CRINGE = -Wno-documentation-unknown-command -Wno-documentation -Wno-documentation-unknown-command

WARNINGS = -Weverything $(CRINGE) $(SANITIZE)

CC=clang
CFLAGS  = -O3 -march=native --std=c17 -ffast-math -flto ${PROF_${MODE}} -mretpoline $(WARNINGS) -fstack-clash-protection -fcf-protection

LDFLAGS = --ld-path=/usr/bin/ld.lld -O3

# 1
# flags
STCPPFLAGS = -DVERSION=\"$(VERSION)\" -D_XOPEN_SOURCE=600 $(CFLAGS)
STCFLAGS = $(INCS) $(STCPPFLAGS) $(CPPFLAGS) $(CFLAGS)
STLDFLAGS = $(LIBS) $(LDFLAGS)

