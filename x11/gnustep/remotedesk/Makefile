# $OpenBSD: Makefile,v 1.15 2017/07/27 11:01:33 sthen Exp $

COMMENT=	GNUstep rdesktop frontend

REVISION =	10
DISTNAME=	RemoteDesk-0.1

CATEGORIES=	x11
HOMEPAGE=	http://gap.nongnu.org/remotedesk/
MASTER_SITES=	${MASTER_SITE_SAVANNAH:=gap/}

MODULES =	x11/gnustep
WANTLIB += ${COMPILER_LIBCXX}
RUN_DEPENDS=	x11/rdesktop

.include <bsd.port.mk>
