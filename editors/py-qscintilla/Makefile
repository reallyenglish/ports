# $OpenBSD: Makefile,v 1.12 2017/07/26 22:45:19 sthen Exp $

COMMENT =	Python binding for the Scintilla source code editor

VERSION =	2.9.3
DISTNAME =	QScintilla_gpl-${VERSION}
PKGNAME =	py-qscintilla-${VERSION}
CATEGORIES =	editors x11 devel
REVISION =	0

HOMEPAGE =	http://www.riverbankcomputing.com/software/qscintilla/

# GPLv2/GPLv3
PERMIT_PACKAGE_CDROM =	Yes

MASTER_SITES =  ${MASTER_SITE_SOURCEFORGE:=pyqt/}

MODULES = lang/python x11/qt4

BUILD_DEPENDS =	${RUN_DEPENDS}
RUN_DEPENDS = devel/py-sip \
		x11/py-qt4 \
		x11/dbus-python
LIB_DEPENDS = editors/qscintilla

WANTLIB += ICE QtGui SM X11 Xext Xi Xinerama Xrender fontconfig
WANTLIB += freetype m qscintilla2 ${COMPILER_LIBCXX} pthread

WRKSRC =	${WRKDIST}/Python

NO_TEST =	Yes

CONFIGURE_STYLE = simple
CONFIGURE_SCRIPT =	${MODPY_BIN} ${WRKSRC}/configure.py
CONFIGURE_ARGS = --qmake=${LOCALBASE}/bin/qmake4 \
		--qsci-libdir=${LOCALBASE}/lib \
		--pyqt-sipdir=${LOCALBASE}/share/sip

MAKE_ENV =	INSTALL_ROOT="${WRKINST}"

.include <bsd.port.mk>
