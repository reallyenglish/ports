# $OpenBSD: Makefile,v 1.1.1.1 2016/10/10 09:33:17 bentley Exp $

COMMENT =		interactive test suite for agar

PKGNAME =		agartest-$V

WANTLIB += GL SDL X11 Xinerama ag_core ag_dev ag_gui ag_math c
WANTLIB += db fontconfig freetype jpeg m png pthread z

LIB_DEPENDS =		x11/agar/agar

WRKSRC =		${WRKDIST}/tests

.include <bsd.port.mk>
