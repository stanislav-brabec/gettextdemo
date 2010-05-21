#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.63])
AC_INIT([gettextdemo], [0.1], [Stanislav Brabec <sbrabec@suse.cz>])
AC_CONFIG_SRCDIR([gettextdemo.c])
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_MACRO_DIR([m4])
AM_INIT_AUTOMAKE([-Wall dist-bzip2])
AM_MAINTAINER_MODE
dnl Define GETTEXT_PACKAGE. This is optional, but useful if you want to have a different gettext domain.
GETTEXT_PACKAGE="$PACKAGE"
AC_SUBST([GETTEXT_PACKAGE])
AC_DEFINE_UNQUOTED([GETTEXT_PACKAGE], ["$GETTEXT_PACKAGE"], [Define the gettext package to be used.])

# Checks for programs.
dnl We need C compiler.
AC_PROG_CC

# Checks for libraries.
PKG_CHECK_MODULES(LIBGETTEXTDEMO, libgettextdemo)

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.
dnl Gettext initial check.
AM_GNU_GETTEXT_VERSION([0.17])
dnl This is required for correct locale processing.
AM_GNU_GETTEXT([external],[need-ngettext],[])
dnl Define LOCALEDIR. It is optional, but you often need it in the code.
dnl It may contain prefix path elements and it is not possible to define in config.h.
dnl Define it here and expand by make.
dnl AC_SUBST([localedir], ['$(datadir)/locale'])
CPPFLAGS="$CPPFLAGS -DLOCALEDIR=\\\"\$(localedir)\\\""

AC_CONFIG_FILES([ po/Makefile.in
		  m4/Makefile
		  Makefile
		])
AC_OUTPUT
