# $OpenBSD: Makefile,v 1.68 2017/07/26 22:45:30 sthen Exp $

COMMENT=	gettext(1) files editor for GNOME

GNOME_PROJECT=	gtranslator
GNOME_VERSION=	2.91.7
REVISION=	5

CATEGORIES=	textproc devel

# GPLv3
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += ICE SM X11 Xcomposite Xcursor Xdamage Xext Xfixes Xi
WANTLIB += Xinerama Xrandr Xrender atk-1.0 atk-bridge-2.0 atspi
WANTLIB += c cairo cairo-gobject dbus-1 enchant epoxy expat ffi
WANTLIB += fontconfig freetype gcrypt gda-5.0 gdict-1.0 gdk-3
WANTLIB += gdk_pixbuf-2.0 gdl-3 gettextpo gio-2.0 girepository-1.0
WANTLIB += glib-2.0 gmodule-2.0 gobject-2.0 gpg-error graphite2
WANTLIB += gthread-2.0 gtk-3 gtksourceview-3.0 gtkspell3-3 harfbuzz
WANTLIB += json-glib-1.0 lzma m pango-1.0 pangocairo-1.0 pangoft2-1.0
WANTLIB += pcre peas-1.0 peas-gtk-1.0 pixman-1 png pthread pthread-stubs
WANTLIB += secret-1 ${COMPILER_LIBCXX} xcb xcb-render xcb-shm xml2 z

MODULES=	devel/gettext \
		x11/gnome \
		devel/dconf \
		lang/python

RUN_DEPENDS=	devel/gsettings-desktop-schemas \
		devel/iso-codes
BUILD_DEPENDS=	devel/gsettings-desktop-schemas \
		devel/iso-codes

LIB_DEPENDS=	devel/gettext-tools \
		devel/gobject-introspection \
		devel/json-glib \
		devel/libpeas \
		textproc/gtkspell3 \
		x11/gnome/gdl \
		x11/gtksourceview3 \
		x11/gnome/dictionary \
		x11/gnome/libgda

MODGNOME_TOOLS += desktop-file-utils gobject-introspection gtk-update-icon-cache
MODGNOME_TOOLS += yelp

MODGNOME_CPPFLAGS=	-I${LOCALBASE}/include/db4

CONFIGURE_STYLE=gnu
CONFIGURE_ARGS += --enable-compile-warnings=no

post-install:
	rm ${PREFIX}/lib/gtranslator/*.{a,la}
	rm ${PREFIX}/lib/gtranslator/plugins/*.{a,la}

.include <bsd.port.mk>
