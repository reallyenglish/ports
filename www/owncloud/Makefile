# $OpenBSD: Makefile,v 1.117 2017/09/25 17:26:18 ajacoutot Exp $

COMMENT=		easy and universal access to shared and/or personal files

V=			10.0.3
DISTNAME=		owncloud-${V}
EXTRACT_SUFX=		.tar.bz2

CATEGORIES=		www

HOMEPAGE=		http://owncloud.org/

MAINTAINER=		Antoine Jacoutot <ajacoutot@openbsd.org>

# AGPLv3 (GNU Affero Public License)
# jQuery: MIT / GPLv3
# HTTP: 3 clause BSD
# MDB2: BSD-like
# User: AGPL
# XML/RPC: MIT / PHP
# Silk icons: Creative Commons Attribution
PERMIT_PACKAGE_CDROM=	Yes

MASTER_SITES=		http://download.owncloud.org/community/

MODULES=		lang/php

NO_BUILD=		Yes
NO_TEST=		Yes
PKG_ARCH=		*

WRKDIST=		${WRKDIR}/owncloud

PREFIX=			${VARBASE}/www
INSTDIR=		${PREFIX}/owncloud
TINSTDIR=		${TRUEPREFIX}/owncloud
VR=			${V:R}
SUBST_VARS=		INSTDIR TINSTDIR MODPHP_BIN VR

RUN_DEPENDS=		lang/php/${MODPHP_VERSION},-gd \
			lang/php/${MODPHP_VERSION},-zip

# http user authentication
RUN_DEPENDS +=		lang/php/${MODPHP_VERSION},-curl

# apps extraction
RUN_DEPENDS +=		lang/php/${MODPHP_VERSION},-bz2

# sorting of non-ASCII characters
RUN_DEPENDS +=		lang/php/${MODPHP_VERSION},-intl

# increase file encryption performance
RUN_DEPENDS +=		lang/php/${MODPHP_VERSION},-mcrypt

# distributed caching and Transactional File Locking
RUN_DEPENDS +=		databases/pecl-redis

do-install:
	cp -Rp ${WRKSRC} ${INSTDIR}
	mv ${INSTDIR}/.htaccess ${INSTDIR}/.htaccess.dist
	find ${INSTDIR} -name '*.orig' -print0 | xargs -r0 rm
	chown -R ${BINOWN}:${BINGRP} ${INSTDIR}

	chmod +x ${INSTDIR}/occ
	perl -pi -e '$$. == 1 && s|^.*env php.*$$|\#!${MODPHP_BIN}|;' \
		-e 'close ARGV if eof;' \
		${INSTDIR}/occ

	${INSTALL_DATA_DIR} ${PREFIX}/conf/modules.sample
	${SUBST_CMD} -m 0644 -c ${FILESDIR}/httpd-owncloud.conf.dist.in \
		${PREFIX}/conf/modules.sample/httpd-owncloud.conf.dist
	${INSTALL_DATA} ${FILESDIR}/config.php.dist.in \
		${INSTDIR}/config/config.php.dist

.include <bsd.port.mk>
