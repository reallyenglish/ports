# $OpenBSD: Makefile,v 1.155 2017/05/26 18:58:52 ajacoutot Exp $

COMMENT=	GNOME terminal

GNOME_PROJECT=	gnome-terminal
GNOME_VERSION=	3.24.2

# GPLv3+
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += ICE SM X11 Xcomposite Xcursor Xdamage Xext Xfixes Xi
WANTLIB += Xinerama Xrandr Xrender atk-1.0 atk-bridge-2.0 atspi
WANTLIB += c cairo cairo-gobject dbus-1 dbus-glib-1 dconf uuid
WANTLIB += expat ffi fontconfig freetype gconf-2 gdk-3 gdk_pixbuf-2.0
WANTLIB += gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0 graphite2
WANTLIB += gthread-2.0 gtk-3 harfbuzz m unistring
WANTLIB += pango-1.0 pangocairo-1.0 pangoft2-1.0 pcre pixman-1
WANTLIB += png pthread pthread-stubs vte-2.91 xcb xcb-render
WANTLIB += xcb-shm z nautilus-extension iconv intl idn2
WANTLIB += epoxy gmp gnutls hogweed nettle p11-kit tasn1
WANTLIB += archive bz2 crypto gnome-autoar-0 lz4 lzma pcre2-8

MODULES=	devel/dconf \
		x11/gnome

BUILD_DEPENDS=	devel/gsettings-desktop-schemas \
		x11/gnome/shell
RUN_DEPENDS=	devel/gsettings-desktop-schemas

LIB_DEPENDS=	devel/gconf2 \
		devel/vte3>=0.46.1 \
		sysutils/e2fsprogs \
		x11/gnome/nautilus>=3.22.1

MODGNOME_TOOLS=	desktop-file-utils vala yelp

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS +=	--enable-debug

post-install:
	rm ${PREFIX}/lib/nautilus/extensions-3.0/*.{a,la}
	rm -r ${PREFIX}/lib/systemd/

.include <bsd.port.mk>
