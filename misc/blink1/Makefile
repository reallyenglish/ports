# $OpenBSD: Makefile,v 1.5 2016/03/16 16:46:32 naddy Exp $

COMMENT =		software tools for blink(1) LED notification light

V =			1.98
DISTNAME =		${GH_PROJECT}-${V}

SO_V =			0.1
SHARED_LIBS =		blink1	${SO_V}

CATEGORIES =		misc

HOMEPAGE =		http://blink1.thingm.com/

MAINTAINER =		Joerg Jung <jung@openbsd.org>

# Creative Commons - Attribution - ShareAlike 3.0
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB += 		c pthread usb

GH_ACCOUNT =		todbot
GH_PROJECT =		blink1
GH_TAGNAME =		v${V}

LIB_DEPENDS =		devel/libusb-compat

MAKE_FLAGS =		CC="${CC}" USBLIB_TYPE=HIDDATA \
                        GH_TAGNAME=${GH_TAGNAME} SO_V=${SO_V}
MAKE_ENV =		LDFLAGS="${LDFLAGS}"
FAKE_FLAGS =		DESTDIR=""

USE_GMAKE =		Yes

NO_TEST =		Yes

WRKSRC =		${WRKDIST}/commandline

.include <bsd.port.mk>
