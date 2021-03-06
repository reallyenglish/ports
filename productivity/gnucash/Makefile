# $OpenBSD: Makefile,v 1.93 2017/10/11 08:21:16 ajacoutot Exp $

COMMENT =		personal and small-business financial-accounting software

GNOME_PROJECT =		gnucash
GNOME_VERSION =		2.6.18
EXTRACT_SUFX =		.tar.bz2

DISTFILES =		${DISTNAME}-1${EXTRACT_SUFX} \
			gnucash-docs-${GNOME_VERSION}.tar.gz

SHARED_LIBS +=  gnc-qof              2.0      # 1.4
SHARED_LIBS +=  gnc-core-utils       0.0      # unknown
SHARED_LIBS +=  gnc-module           0.0      # unknown
SHARED_LIBS +=  gnc-backend-xml-utils 0.0     # unknown
SHARED_LIBS +=  gnc-backend-sql      0.0      # unknown
SHARED_LIBS +=  gnc-gnome            0.0      # unknown
SHARED_LIBS +=  gncmod-qif           0.0      # unknown
SHARED_LIBS +=  gnc-business-ledger  0.0      # unknown

CATEGORIES =		productivity

HOMEPAGE =		http://www.gnucash.org/

MAINTAINER =		Antoine Jacoutot <ajacoutot@openbsd.org>

# GPLv3
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB += EGL GL ICE SM X11 X11-xcb Xcomposite Xcursor Xdamage
WANTLIB += Xext Xfixes Xi Xinerama Xrandr Xrender Xt Xxf86vm art_lgpl_2
WANTLIB += atk-1.0 bz2 c cairo dbi dbus-1 dbus-glib-1 drm enchant
WANTLIB += expat ffi fontconfig freetype gailutil gbm gconf-2
WANTLIB += gcrypt gdk-x11-2.0 gdk_pixbuf-2.0 gio-2.0 glapi glib-2.0
WANTLIB += gmodule-2.0 gmp gnome-keyring gnomecanvas-2 gobject-2.0
WANTLIB += goffice-0.8 gpg-error graphite2 gsf-1 gstapp-1.0 gstaudio-1.0
WANTLIB += gstbase-1.0 gstfft-1.0 gstpbutils-1.0 gstreamer-1.0
WANTLIB += gsttag-1.0 gstvideo-1.0 gthread-2.0 gtk-x11-2.0 guile
WANTLIB += harfbuzz harfbuzz-icu iconv icudata icui18n icuuc intl
WANTLIB += javascriptcoregtk-1.0 jpeg ltdl lzma m orc-0.4 pango-1.0
WANTLIB += pangocairo-1.0 pangoft2-1.0 pcre pixman-1 png pthread
WANTLIB += pthread-stubs secret-1 soup-2.4 sqlite3 ${COMPILER_LIBCXX} webkitgtk-1.0
WANTLIB += webp xcb xcb-dri2 xcb-glx xcb-render xcb-shm xcb-xfixes
WANTLIB += xml2 xslt z

MASTER_SITES =		${MASTER_SITE_SOURCEFORGE:=gnucash/}

MODULES =		devel/dconf \
			x11/gnome

MODGNOME_TOOLS =	desktop-file-utils gtk-update-icon-cache yelp

BUILD_DEPENDS =		databases/libdbi-drivers,-sqlite3
RUN_DEPENDS =		databases/libdbi-drivers,-sqlite3

# gnc-fq-helper(1)
RUN_DEPENDS +=		converters/p5-DateManip \
			misc/p5-Finance-Quote

LIB_DEPENDS =		databases/libdbi \
			devel/goffice08 \
			lang/guile \
			www/webkit \
			x11/gnome/libgnome-keyring \
			x11/gnome/libgnomecanvas

CONFIGURE_STYLE =	gnu
CONFIGURE_ARGS =	--with-dbi-dbd-dir=${LOCALBASE}/lib/dbd \
			--with-xdg-data-dirs=${LOCALBASE}/share

# --disable-ofx until libofx/libsp is fixed to work with .so
CONFIGURE_ARGS +=	--disable-doxygen \
			--disable-ofx

MODGNOME_CPPFLAGS =	-I${X11BASE}/include

FAKE_FLAGS =		sysconfdir=${PREFIX}/share/examples/
DOC_DIR =		${WRKDIR}/gnucash-docs-${GNOME_VERSION}

# XXX prefer guile1: guile2 segfaults during build when using dpb(1)
# XXX make sure guile2 headers are picked up first (over guile1);
# cannot use CPPFLAGS/CFLAGS since they get appended last
#MAKE_FLAGS +=		CC="${CC} -I${LOCALBASE}/include/guile/2.2"
pre-configure:
	sed -i 's,guile-2.0,guile-99.99,g' ${WRKSRC}/configure

# XXX hack: check if still needed at next release (autohell)
DOCS_ENV =		ACLOCAL=true AUTOCONF=true AUTOMAKE=true AUTOHEADER=true

post-configure:
	cd ${DOC_DIR} && ${SETENV} ${CONFIGURE_ENV} /bin/sh ./configure

post-build:
	cd ${DOC_DIR} && ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} ${MAKE_FLAGS} ${DOCS_ENV}

post-install:
	cd ${DOC_DIR} && \
		${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} ${ALL_FAKE_FLAGS} ${DOCS_ENV} install
	rm ${PREFIX}/lib/gnucash/*.{a,la}
# requires hardcoded gnucash sources path to work
	rm ${PREFIX}/bin/gnucash-valgrind

.include <bsd.port.mk>
