SUBDIRS = m4 po

AM_CPPFLAGS = $(LIBGETTEXTDEMO_CFLAGS)

bin_PROGRAMS = gettextdemo
gettextdemo_SOURCES = gettextdemo.c
gettextdemo_LDADD = $(LIBGETTEXTDEMO_LIBS)

EXTRA_DIST = config.rpath m4/ChangeLog

ACLOCAL_AMFLAGS = -I m4
