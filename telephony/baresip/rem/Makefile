# $OpenBSD: Makefile,v 1.7 2017/06/08 14:29:37 czarkoff Exp $

COMMENT =		library for real-time audio and video processing

V =			0.5.1
DISTNAME =		rem-${V}
SHARED_LIBS =		rem	0.3
CATEGORIES +=		multimedia devel

WANTLIB += m re

LIB_DEPENDS =		telephony/baresip/re

MAKE_FLAGS =		LIB_SUFFIX=.so.${LIBrem_VERSION}
MAKE_ENV +=		LIBS="-lm -lre"

ALL_TARGET =		librem.a librem.so.${LIBrem_VERSION}

do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/include/rem
	${INSTALL_DATA} ${WRKBUILD}/include/*.h ${PREFIX}/include/rem
	${INSTALL_DATA} ${WRKBUILD}/librem.a ${PREFIX}/lib
	${INSTALL_DATA} ${WRKBUILD}/librem.so.${LIBrem_VERSION} ${PREFIX}/lib

.include <bsd.port.mk>
