# $OpenBSD: Makefile,v 1.7 2017/09/26 15:58:21 dcoppa Exp $

COMMENT =	inspect, edit and validate Ogg files

V =		1.1.1
PKGNAME =	oggz-${V}
DISTNAME =	liboggz-${V}
CATEGORIES =	multimedia
HOMEPAGE =	http://www.xiph.org/oggz/
REVISION =	2

SHARED_LIBS =	oggz	0.0

# BSD
PERMIT_PACKAGE_CDROM =		Yes

MASTER_SITES =	http://downloads.xiph.org/releases/liboggz/

WANTLIB =	c ogg m

LIB_DEPENDS =	audio/libogg

CONFIGURE_STYLE =	autoconf
AUTOCONF_VERSION =	2.65

.include <bsd.port.mk>
