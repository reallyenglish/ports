# $OpenBSD: Makefile,v 1.36 2017/10/16 21:27:36 dcoppa Exp $

COMMENT=	IEEE 802.1X supplicant

DISTNAME=	wpa_supplicant-2.6
REVISION=	1
CATEGORIES=	security net

HOMEPAGE=	http://w1.fi/wpa_supplicant/

MAINTAINER=	David Coppa <dcoppa@openbsd.org>

# BSD
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += c ssl crypto pcap pcsclite pthread

LIB_DEPENDS=	security/pcsc-lite

MASTER_SITES=	http://w1.fi/releases/

USE_GMAKE=	Yes
NO_TEST=	Yes
MAKE_FLAGS=	V=1
MAKE_ENV=	CFLAGS="${CFLAGS}" CC="${CC}"

WRKSRC=		${WRKDIST}/wpa_supplicant

EXAMPLEDIR=	${PREFIX}/share/examples/wpa_supplicant

post-extract:
	@${SUBST_CMD} -m 444 -c ${FILESDIR}/config ${WRKSRC}/.config

post-install:
	@#${INSTALL_PROGRAM} ${WRKBUILD}/wpa_priv ${PREFIX}/sbin
	${INSTALL_MAN} ${WRKBUILD}/doc/docbook/*.5 ${PREFIX}/man/man5/
	${INSTALL_MAN} ${WRKBUILD}/doc/docbook/*.8 ${PREFIX}/man/man8/
	${INSTALL_DATA_DIR} ${EXAMPLEDIR}
	${INSTALL_DATA}  ${WRKBUILD}/wpa_supplicant.conf \
		${EXAMPLEDIR}/wpa_supplicant.conf.dist
	${INSTALL_DATA}  ${FILESDIR}/wpa_supplicant.conf \
		${EXAMPLEDIR}/wpa_supplicant.conf

.include <bsd.port.mk>
