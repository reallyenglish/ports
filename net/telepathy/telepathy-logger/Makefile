# $OpenBSD: Makefile,v 1.49 2017/05/16 19:31:34 landry Exp $

COMMENT=	flexible communications framework, logger component

DISTNAME=	telepathy-logger-0.8.2
REVISION=	1

SHARED_LIBS +=  telepathy-logger     4.1      # 6.0

HOMEPAGE=	${HOMEPAGE_TP:=Logger}

MASTER_SITES=	${MASTER_SITES_TP:=telepathy-logger/}
EXTRACT_SUFX=	.tar.bz2

WANTLIB += c dbus-1 dbus-glib-1 ffi gio-2.0 glib-2.0 gmodule-2.0
WANTLIB += gobject-2.0 lzma m pcre pthread sqlite3 telepathy-glib xml2 z

MODULES=	devel/dconf \
		devel/gettext \
		lang/python \
		textproc/intltool

MODPY_RUNDEP=	No

BUILD_DEPENDS=	devel/gobject-introspection \
		devel/py-twisted \
		x11/gnome/doc-utils
LIB_DEPENDS=	databases/sqlite3 \
		net/telepathy/telepathy-glib \
		textproc/libxml \
		x11/dbus-glib

MODGCONF2_SCHEMAS_DIR=	telepathy-logger

TEST_IS_INTERACTIVE=x11

.include <bsd.port.mk>
