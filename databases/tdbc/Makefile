# $OpenBSD: Makefile,v 1.8 2017/06/02 19:54:15 schwarze Exp $

COMMENT =		Tcl Database Connectivity

V =			1.0.4

DISTNAME =		tdbc${V}
PKGNAME =		tdbc-${V}
REVISION =		0
SHARED_LIBS =		tdbc${V:S/.//g} 0.0
CATEGORIES =		databases
HOMEPAGE =		http://tdbc.tcl.tk/
MAINTAINER =		Stuart Cassoff <stwo@users.sourceforge.net>

# BSD
PERMIT_PACKAGE_CDROM =	Yes

MASTER_SITES =		${MASTER_SITE_SOURCEFORGE:=tcl/}
MODULES =		lang/tcl

# TDBC needs TclOO, which is in Tcl 8.6
MODTCL_VERSION =	8.6

BUILD_DEPENDS =		${MODTCL_BUILD_DEPENDS}
RUN_DEPENDS =		${MODTCL_RUN_DEPENDS}

FAKE_FLAGS =		PKG_DIR=tdbc \
			pkglibdir='$$(libdir)/tcl/$$(PKG_DIR)'

SEPARATE_BUILD =	Yes
CONFIGURE_STYLE =	gnu

CONFIGURE_ARGS +=	--with-tcl=${MODTCL_LIBDIR} \
			--includedir=${PREFIX}/include/tdbc \
			SHLIB_VERSION=${LIBtdbc${V:S/.//g}_VERSION}

TEST_TARGET =		test

.include <bsd.port.mk>
