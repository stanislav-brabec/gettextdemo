#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include <stdio.h>
#include <locale.h>
#include <libgettextdemo.h>

#ifdef ENABLE_NLS
#include <libintl.h>
#define _(string) dgettext (GETTEXT_PACKAGE, string)
#define N_(string) (string)
#define Q_(string1, stringm, n) dngettext (GETTEXT_PACKAGE, string1, stringm, n)
#else
#define _(string) (string)
#define N_(string) (string)
#define Q_(string1, stringm, n) (n == 1 ? string1, stringm)
#define dgettext(domain, string) (string)
#endif

int
main(void)
{
    int i;
#ifdef ENABLE_NLS
    setlocale(LC_ALL, "");
    bindtextdomain(GETTEXT_PACKAGE, LOCALEDIR);
    textdomain(GETTEXT_PACKAGE);
#endif
    printf(_("This string comes from gettextdemo binary.\n"));
    printf(_("A big city: %s\n"),
        /* TRANSLATORS: Pick a big city in your area. */
        _("New York"));
    libgettextdemo_hallo();
    for (i=0; i<10; i++)
        libgettextdemo_dog_counter(i);
    for (i=0; i<5; i++)
        libgettextdemo_animal(i);
    return 0;
}
