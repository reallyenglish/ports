# $OpenBSD: Makefile,v 1.20 2017/09/15 16:27:47 gonzalo Exp $

COMMENT=	security auditing tool

DISTNAME =	lynis-2.5.5

CATEGORIES=	security

HOMEPAGE=	http://cisofy.com

MAINTAINER=	Gonzalo L. R. <gonzalo@openbsd.org>

# GPLv3
PERMIT_PACKAGE_CDROM=	Yes

MASTER_SITES=	http://cisofy.com/files/

PKG_ARCH=	*

NO_BUILD=	Yes
NO_TEST=	Yes

WRKDIST=	${WRKDIR}/lynis

post-extract:
	@perl -pi -e 's,usr/share,usr/local/share,g' \
		${WRKDIST}/lynis
do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/{,doc,examples}/lynis/
	@cp -r ${WRKDIST}/{plugins,db,include} \
		${PREFIX}/share/lynis/
	cd ${WRKSRC}; ${INSTALL_DATA} LICENSE \
		FAQ CHANGELOG.md README INSTALL \
		${PREFIX}/share/doc/lynis/
	${INSTALL_DATA} ${WRKSRC}/default.prf \
		${PREFIX}/share/examples/lynis/
	${INSTALL_MAN} ${WRKSRC}/lynis.8 ${PREFIX}/man/man8/
	${INSTALL_SCRIPT} ${WRKSRC}/lynis ${PREFIX}/bin/

.include <bsd.port.mk>
