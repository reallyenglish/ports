# $OpenBSD: Makefile,v 1.19 2017/03/24 18:29:37 landry Exp $

COMMENT =	CalDAV/CardDav calendar/contacts server

GITLAB_PROJECT = davical
GITLAB_ACCOUNT = davical-project
GITLAB_TAG =	r1.1.3.1
DISTNAME =	${GITLAB_PROJECT}-${GITLAB_TAG:S/r//}
CATEGORIES =	productivity net
REVISION =	3

HOMEPAGE =	http://www.davical.org/

MAINTAINER =	Landry Breuil <landry@openbsd.org>

# GPLv2+
PERMIT_PACKAGE_CDROM =	Yes

MASTER_SITES =	https://rhaalovely.net/stuff/

MODULES =	lang/php
PREFIX =	${VARBASE}/www
INSTDIR =	${PREFIX}/davical
WRKDIST =	${WRKDIR}/${GITLAB_PROJECT}.git
TINSTDIR =	${TRUEPREFIX}/davical

SUBST_VARS =	TINSTDIR

RUN_DEPENDS +=	lang/php/${MODPHP_VERSION},-curl \
		lang/php/${MODPHP_VERSION},-pdo_pgsql \
		www/awl>=0.55 \
		devel/p5-YAML \
		databases/p5-DBD-Pg

NO_BUILD =	Yes
NO_TEST =	Yes
PKG_ARCH =	*

do-install:
	${INSTALL_DATA_DIR} ${INSTDIR}
	cp -Rp ${WRKSRC}/{README,INSTALL,dba,inc,config,htdocs,po,scripts} ${INSTDIR}
	${SUBST_CMD} -m 0644 -c ${FILESDIR}/davical.conf ${INSTDIR}/davical.conf
	chown -R ${SHAREOWN}:${SHAREGRP} ${INSTDIR}

.include <bsd.port.mk>
