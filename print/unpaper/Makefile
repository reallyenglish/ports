# $OpenBSD: Makefile,v 1.5 2016/11/10 09:03:26 ajacoutot Exp $

COMMENT=		post-processing tool for scanned paper sheets

DISTNAME=		unpaper-6.1

CATEGORIES=		print graphics

HOMEPAGE=		https://www.flameeyes.eu/projects/unpaper

MAINTAINER=		Antoine Jacoutot <ajacoutot@openbsd.org>

# GPLv2
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += avcodec avformat avutil c m

MASTER_SITES=		https://www.flameeyes.eu/files/
EXTRACT_SUFX=		.tar.xz

BUILD_DEPENDS=		textproc/libxslt # xsltproc
LIB_DEPENDS=		graphics/ffmpeg
TEST_DEPENDS=		sysutils/coreutils

CONFIGURE_STYLE=	gnu

post-install:
# useless
	rm -rf ${PREFIX}/share/doc/unpaper

pre-test:
	ln -fs ${LOCALBASE}/bin/gmd5sum ${WRKDIR}/bin/md5sum

.include <bsd.port.mk>
