# $OpenBSD: Makefile,v 1.13 2017/08/14 16:51:54 sthen Exp $

COMMENT =		deduplicating backup program

MODPY_EGG_VERSION =	1.0.11
DISTNAME =		borgbackup-${MODPY_EGG_VERSION}

MODPY_PI =		Yes

CATEGORIES =		sysutils

MAINTAINER =		Bjorn Ketelaars <bjorn.ketelaars@hydroxide.nl>

# BSD-3
PERMIT_PACKAGE_CDROM =	Yes

MODULES =		lang/python

MODPY_VERSION =		${MODPY_DEFAULT_VERSION_3}

WANTLIB +=		${MODPY_WANTLIB} crypto lz4 pthread

LIB_DEPENDS +=		${MODPY_LIB_DEPENDS} archivers/lz4

BUILD_DEPENDS +=	${RUN_DEPENDS} \
			devel/py-setuptools_scm${MODPY_FLAVOR} \
			textproc/py-sphinx${MODPY_FLAVOR}

RUN_DEPENDS +=		net/py-msgpack${MODPY_FLAVOR}

TEST_DEPENDS +=		${RUN_DEPENDS} \
			devel/py-test${MODPY_FLAVOR} \
			devel/py-test-benchmark${MODPY_FLAVOR} \
			devel/py-test-xdist${MODPY_FLAVOR}

MODPY_SETUPTOOLS =	Yes

post-build:
	${MODPY_CMD} build_ext --inplace
	cd ${WRKSRC}/docs; env PYTHONPATH=${WRKSRC} \
		make man SPHINXBUILD=sphinx-build${MODPY_BIN_SUFFIX}

post-install:
	${INSTALL_MAN} ${WRKSRC}/docs/_build/man/borg.1 ${PREFIX}/man/man1/borg.1

do-test: fake
	@printf "\n*** NOTE: borgbackup fails all tests when it is already installed ***\n\n"
	cd ${WRKSRC}; \
		PATH=${WRKINST}/usr/local/bin:${PATH} \
		PYTHONPATH=${WRKSRC} \
		${MODPY_BIN} -m pytest --ignore lib*

.include <bsd.port.mk>
