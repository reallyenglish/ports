# $OpenBSD: Makefile,v 1.2 2015/11/21 14:21:56 rpointel Exp $

COMMENT =		disassembles SWF

DISTNAME =		flasm16src
PKGNAME =		flasm-1.62
REVISION =		0

CATEGORIES =		security devel

HOMEPAGE =		http://www.nowrap.de/flasm

MAINTAINER =		Remi Pointel <rpointel@openbsd.org>

# https://github.com/coolwanglu/flasm/blob/master/LICENSE.TXT
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB += c z

MASTER_SITES =		http://www.nowrap.de/download/

EXTRACT_SUFX =		.zip

BUILD_DEPENDS =		devel/gperf \
			devel/bison

USE_GMAKE =		Yes
MAKE_FLAGS =            CC="${CC}" CFLAGS="-Wall ${CFLAGS}"

NO_TEST =		Yes

WRKDIST =		${WRKDIR}

do-install:
	${INSTALL_PROGRAM} ${WRKDIST}/flasm ${PREFIX}/bin/
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/flasm/
.for i in LICENSE.TXT flasm.html flasm.ini
	${INSTALL_DATA} ${WRKDIST}/${i} ${PREFIX}/share/doc/flasm/
.endfor

.include <bsd.port.mk>
