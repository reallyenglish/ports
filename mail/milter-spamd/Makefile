# $OpenBSD: Makefile,v 1.23 2015/07/15 19:47:35 ajacoutot Exp $

COMMENT=	sendmail milter plugin for SpamAssassin spamd

DISTNAME=	milter-spamd-0.6
REVISION=	3
CATEGORIES=	mail
MASTER_SITES=	http://www.benzedrine.ch/

HOMEPAGE=	http://www.benzedrine.ch/milter-spamd.html

MAINTAINER=	Daniel Hartmeier <dhartmei@openbsd.org>

# BSD
PERMIT_PACKAGE_CDROM=	Yes
WANTLIB=		c milter pthread

LIB_DEPENDS=	mail/sendmail,-libmilter

MAKE_FLAGS=	CPPFLAGS="-I${LOCALBASE}/include" \
		CFLAGS="-Wall -Wstrict-prototypes ${CFLAGS}" \
		LDFLAGS="-L${LOCALBASE}/lib ${LDFLAGS}"

NO_TEST=	Yes

do-configure:
	@perl -pi -e 's,/etc/mi,${SYSCONFDIR}/mi,g' ${WRKSRC}/milter-spamd.{8,c}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/milter-spamd ${PREFIX}/libexec
	${INSTALL_MAN} ${WRKSRC}/milter-spamd.8 ${PREFIX}/man/man8

.include <bsd.port.mk>
