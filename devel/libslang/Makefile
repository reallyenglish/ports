# $OpenBSD: Makefile,v 1.61 2016/09/13 14:40:30 naddy Exp $

COMMENT=	stack-based interpreter for terminal applications

DISTNAME=	slang-2.2.4
REVISION=	2
PKGNAME=	lib${DISTNAME}
SHARED_LIBS=	slang 16.0

CATEGORIES=	devel
MASTER_SITES=	http://www.jedsoft.org/releases/slang/old/

HOMEPAGE=	http://jedsoft.org/slang/

# Artistic
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += c iconv m onig pcre png termcap z

LIB_DEPENDS=		converters/libiconv \
			devel/pcre \
			graphics/png \
			textproc/oniguruma

AUTOCONF_VERSION=	2.61
CONFIGURE_STYLE=	autoconf no-autoheader
AUTOCONF_DIR=		${WRKSRC}/autoconf
MODGNU_CONFIG_GUESS_DIRS= ${WRKSRC}/autoconf

CONFIGURE_ARGS=		--with-pnginc=${LOCALBASE}/include \
			--with-pnglib=${LOCALBASE}/lib
TEST_TARGET=		runtests
TEST_FLAGS=		TCAPLIB="-ltermlib"

MAKE_ENV=		LIBslang_MAJOR=${LIBslang_VERSION:R} \
			LIBslang_MINOR=${LIBslang_VERSION:E}

pre-configure:
	cd ${AUTOCONF_DIR}; cp configure ..

.include <bsd.port.mk>
