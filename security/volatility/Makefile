# $OpenBSD#

COMMENT =		memory artifact extraction utility framework

MODPY_EGG_VERSION =	2.6
DISTNAME =		volatility-${MODPY_EGG_VERSION}

EXTRACT_SUFX =		.zip

CATEGORIES =		security

HOMEPAGE =		http://www.volatilityfoundation.org/

MAINTAINER = 		Remi Pointel <rpointel@openbsd.org>

# GPLv2
PERMIT_PACKAGE_CDROM = Yes

MASTER_SITES =		http://downloads.volatilityfoundation.org/releases/${MODPY_EGG_VERSION}/

MODULES =		lang/python
MODPY_SETUPTOOLS = 	Yes

RUN_DEPENDS =	security/distorm3 \
		security/yara/python \
		graphics/py-Pillow \
		security/py-crypto

WRKDIST = 	${WRKDIR}/volatility-master

NO_TEST =		Yes

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/volatility/
.for dir in contrib tools
	mv ${PREFIX}/${dir} ${PREFIX}/share/volatility/
.endfor

.include <bsd.port.mk>
