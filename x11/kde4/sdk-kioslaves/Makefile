# $OpenBSD: Makefile,v 1.8 2017/07/27 11:57:50 sthen Exp $

COMMENT =	development-related KIO modules
DISTNAME =	kdesdk-kioslaves-${MODKDE4_VERSION}
REVISION =	3

CATEGORIES =	devel
HOMEPAGE =	http://projects.kde.org/projects/kde/kdesdk/kdesdk-kioslaves

WANTLIB =  c m pthread
WANTLIB += ${COMPILER_LIBCXX}
WANTLIB += lib/qt4/QtDBus lib/qt4/QtGui lib/qt4/QtNetwork lib/qt4/QtSvg
WANTLIB += lib/qt4/QtXml
WANTLIB += ${KDE4LIB}/kdeui ${KDE4LIB}/kio
WANTLIB += apr-1 svn_client-1 svn_delta-1 svn_fs-1 svn_ra-1 svn_subr-1
WANTLIB +=

MODKDE4_USE =	libs

LIB_DEPENDS =	devel/subversion

CONFIGURE_ARGS +=	-DCMAKE_DISABLE_FIND_PACKAGE_SVN=Yes

post-patch:
	perl -pi -e 's/kio_svn_helper/kio_svn_helper4/' \
		${WRKSRC}/svn/svnhelper/*.desktop

.include <bsd.port.mk>
