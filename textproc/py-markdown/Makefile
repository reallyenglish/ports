# $OpenBSD: Makefile,v 1.4 2017/02/11 18:58:01 shadchin Exp $

COMMENT=		text-to-HTML conversion tool

MODPY_EGG_VERSION=	2.6.8
DISTNAME=		Markdown-${MODPY_EGG_VERSION}
PKGNAME=		py-markdown-${MODPY_EGG_VERSION}
CATEGORIES=		textproc

MAINTAINER=		Will Maier <willmaier@ml1.net>

# BSD
PERMIT_PACKAGE_CDROM=	Yes

MODULES=		lang/python
MODPY_PI=		Yes

FLAVORS=		python3
FLAVOR?=

TEST_DEPENDS=		devel/py-nose${MODPY_FLAVOR} \
			textproc/py-yaml${MODPY_FLAVOR}

post-install:
	mv ${PREFIX}/bin/markdown_py{,${MODPY_BIN_SUFFIX}}

do-test:
	cd ${WRKSRC}/tests && ${LOCALBASE}/bin/nosetests${MODPY_BIN_SUFFIX}

.include <bsd.port.mk>
