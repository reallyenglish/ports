# $OpenBSD: Makefile,v 1.18 2017/07/26 22:45:19 sthen Exp $

COMMENT =	Qt4 port of the Scintilla source code editor

# XXX update py-qscintilla alongside this port (same distfile).
VERSION =	2.9.3
DISTNAME =	QScintilla_gpl-${VERSION}
PKGNAME =	qscintilla-${VERSION}
CATEGORIES =	editors x11
REVISION =	0

SHARED_LIBS =	qscintilla2 5.0

HOMEPAGE =	http://www.riverbankcomputing.com/software/qscintilla/

# GPLv2/GPLv3
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB += ICE QtGui SM X11 Xext Xi Xinerama Xrender fontconfig
WANTLIB += freetype m pthread ${COMPILER_LIBCXX}

MASTER_SITES =  ${MASTER_SITE_SOURCEFORGE:=pyqt/}

MODULES =	devel/gettext devel/qmake x11/qt4

SEPARATE_BUILD =	No

CONFIGURE_ENV =	HOME=${WRKDIR}

WRKSRC =	${WRKDIST}/Qt4Qt5

NO_TEST =	Yes

pre-configure:
	${SUBST_CMD} ${WRKSRC}/qscintilla.pro

.include <bsd.port.mk>
