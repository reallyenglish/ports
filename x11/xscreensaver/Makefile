# $OpenBSD: Makefile,v 1.93 2017/07/14 11:36:43 ajacoutot Exp $

COMMENT=		screen saver and locker for the X Window System

DISTNAME=		xscreensaver-5.37
REVISION=		0

CATEGORIES=		x11

HOMEPAGE=		http://www.jwz.org/xscreensaver/

# After updating this port, remember to make update-plist in
# x11/kde/artwork3 and x11/kde4/artwork, too.

# BSD
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += GL GLU ICE SM X11 Xcomposite Xcursor Xdamage Xext Xfixes
WANTLIB += Xft Xi Xinerama Xmu Xpm Xrandr Xrender Xt Xxf86misc
WANTLIB += Xxf86vm atk-1.0 c cairo fontconfig freetype gdk-x11-2.0
WANTLIB += gdk_pixbuf-2.0 gdk_pixbuf_xlib-2.0 gio-2.0 glade-2.0
WANTLIB += gle glib-2.0 gmodule-2.0 gobject-2.0 gtk-x11-2.0 intl
WANTLIB += jpeg m pango-1.0 pangocairo-1.0 pangoft2-1.0 pthread
WANTLIB += util xml2 z

MASTER_SITES=		${HOMEPAGE}

MODULES=		textproc/intltool

RUN_DEPENDS=		devel/desktop-file-utils

LIB_DEPENDS=		devel/libglade2 \
			graphics/gdk-pixbuf2 \
			graphics/gle

# ${FILESDIR}/migrate-xscreensaver-config.sh needs xsltproc
BUILD_DEPENDS +=	textproc/libxslt

# see pre-configure
BUILD_DEPENDS +=	devel/xdg-utils
RUN_DEPENDS +=		devel/xdg-utils

USE_GMAKE=		Yes
NO_TEST=		Yes

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS=		--with-hackdir="${PREFIX}/libexec/xscreensaver" \
			--with-x-app-defaults="${PREFIX}/lib/X11/app-defaults" \
			--without-pam
CONFIGURE_ENV=		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib"

FAKE_FLAGS=		install_prefix=${WRKINST}

pre-configure:
	perl -pi -e 's,gnome-open,xdg-open,g' ${WRKSRC}/configure

post-install:
# remove conflicts (misc/deco, games/circuit)
.for i in deco circuit
	mv ${PREFIX}/man/man6/$i.6 ${PREFIX}/man/man6/xscreensaver-$i.6
.endfor

.include <bsd.port.mk>
