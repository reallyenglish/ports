# $OpenBSD: Makefile,v 1.5 2017/08/22 05:19:17 kirby Exp $

COMMENT =		simple RPC framework based on GObject system

GH_PROJECT = 		libsearpc
GH_TAGNAME = 		v3.1-latest

SHARED_LIBS += 		searpc			0.0 # 1.2

# LGPLv3
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB += ffi glib-2.0 gobject-2.0 iconv intl jansson pcre pthread

MODULES =		lang/python

BUILD_DEPENDS = 	devel/libtool \
			${MODGNU_AUTOMAKE_DEPENDS} \
			${MODGNU_AUTOCONF_DEPENDS}

LIB_DEPENDS =		devel/glib2 \
			devel/jansson

SEPARATE_BUILD =	Yes
CONFIGURE_STYLE =	gnu

AUTOCONF_VERSION =	2.61
AUTOMAKE_VERSION =	1.9

MODPY_ADJ_FILES = 	lib/searpc-codegen.py pysearpc/pygencode.py

pre-configure:
	cd ${WRKSRC} && env AUTOCONF_VERSION=${AUTOCONF_VERSION} \
		AUTOMAKE_VERSION=${AUTOMAKE_VERSION} autoreconf -fi

.include <bsd.port.mk>
