# $OpenBSD: Makefile,v 1.97 2017/04/16 16:02:12 ajacoutot Exp $

# XXX could use brltty and brlapi (with python bindinds) -- not ported yet

PKG_ARCH=		*

COMMENT=		assistive screen reader

GNOME_PROJECT=		orca
GNOME_VERSION=		3.24.0

# LGPLv2
PERMIT_PACKAGE_CDROM=	Yes

MODULES=		lang/python \
			x11/gnome

COMMON_DEPENDS= 	audio/speech-dispatcher \
			devel/liblouis \
			devel/py-gobject3${MODPY_FLAVOR} \
			x11/gnome/py-atspi

BUILD_DEPENDS=		${COMMON_DEPENDS} \
			multimedia/gstreamer1/core \
			x11/gtk+3

RUN_DEPENDS=		${COMMON_DEPENDS} \
			devel/py-setproctitle${MODPY_FLAVOR}

# sndio(7) support, sound.py:123
RUN_DEPENDS +=		multimedia/gstreamer1/plugins-base \
			multimedia/gstreamer1/plugins-good

# pygobject GTK3 introspection (not provided by indirect dependencies)
RUN_DEPENDS +=		x11/gtk+3

MODPY_VERSION=		${MODPY_DEFAULT_VERSION_3}
MODGNOME_TOOLS= 	gtk-update-icon-cache yelp
FAKE_FLAGS=		sysconfdir=${PREFIX}/share/examples/orca/

CONFIGURE_STYLE=	gnu

.include <bsd.port.mk>
