# $OpenBSD: Makefile,v 1.1.1.1 2017/07/29 10:14:21 bluhm Exp $

COMMENT =	a serialization framework for Moose classes

DISTNAME =	MooseX-Storage-0.52
CATEGORIES =	devel

MAINTAINER =		Matthias Pitzl <pitzl@genua.de>

# Perl
PERMIT_PACKAGE_CDROM =	Yes

MODULES =		cpan
RUN_DEPENDS =		converters/p5-JSON-MaybeXS>=1.001000 \
			devel/p5-namespace-autoclean \
			devel/p5-Module-Runtime \
			devel/p5-Moose>=0.99 \
			devel/p5-MooseX-Role-Parameterized \
			devel/p5-IO-stringy \
			devel/p5-YAML \
			textproc/p5-String-RewritePrefix
TEST_DEPENDS =		devel/p5-MooseX-Types \
			devel/p5-Test-Deep \
			devel/p5-Test-Deep-JSON \
			devel/p5-Test-Deep-Type \
			devel/p5-Test-Fatal \
			devel/p5-Test-Requires \
			devel/p5-Test-Without-Module \
			devel/p5-YAML-XS \
			security/p5-Digest-HMAC>=1.03p0

PKG_ARCH =		*

.include <bsd.port.mk>
