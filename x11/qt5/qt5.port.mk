# $OpenBSD: qt5.port.mk,v 1.16 2017/07/17 08:34:37 zhuk Exp $

# This fragment defines MODQT_* variables to make it easier to substitute
# qt3/qt4/qt5 in a port.
MODQT_OVERRIDE_UIC ?=	Yes
MODQT5_OVERRIDE_UIC ?=	${MODQT_OVERRIDE_UIC}

MODQT5_LIBDIR =	${LOCALBASE}/lib/qt5
MODQT_LIBDIR ?= ${MODQT5_LIBDIR}
MODQT5_INCDIR =	${LOCALBASE}/include/X11/qt5
MODQT_INCDIR ?= ${MODQT5_INCDIR}
MODQT5_CONFIGURE_ARGS =	--with-qt-includes=${MODQT5_INCDIR} \
			--with-qt-libraries=${MODQT5_LIBDIR}
MODQT_CONFIGURE_ARGS ?=	${MODQT5_CONFIGURE_ARGS}
_MODQT5_SETUP =	MOC=${MODQT5_MOC} \
		MODQT_INCDIR=${MODQT5_INCDIR} \
		MODQT_LIBDIR=${MODQT5_LIBDIR}
.if ${MODQT5_OVERRIDE_UIC:L} == "yes"
_MODQT5_SETUP +=UIC=${MODQT5_UIC}
.endif

# may be needed to find plugins
MODQT5_MOC =	${LOCALBASE}/bin/moc-qt5
MODQT_MOC ?=	${MODQT5_MOC}
MODQT5_UIC =	${LOCALBASE}/bin/uic-qt5
MODQT_UIC ?=	${MODQT5_UIC}
MODQT5_QMAKE =	${LOCALBASE}/bin/qmake-qt5
MODQT_QMAKE ?=	${MODQT5_QMAKE}
MODQT5_QTDIR =	${LOCALBASE}/lib/qt5
MODQT_QTDIR ?=	${MODQT5_QTDIR}
MODQT5_LRELEASE = ${LOCALBASE}/bin/lrelease-qt5
MODQT_LRELEASE ?= ${MODQT5_LRELEASE}

_MODQT5_CMAKE_PKGS = \
	Qt5 \
	Qt53DCore \
	Qt53DInput \
	Qt53DLogic \
	Qt53DQuick \
	Qt53DQuickInput \
	Qt53DQuickRender \
	Qt5Render \
	Qt5Bluetooth \
	Qt5Concurrent \
	Qt5Core \
	Qt5DBus \
	Qt5Designer \
	Qt5Enginio \
	Qt5Gui \
	Qt5Help \
	Qt5LinguistTools \
	Qt5Location \
	Qt5Multimedia \
	Qt5MultimediaWidgets \
	Qt5Network \
	Qt5Nfc \
	Qt5OpenGL \
	Qt5OpenGLExtensions \
	Qt5Positioning \
	Qt5PrintSupport \
	Qt5Qml \
	Qt5Quick \
	Qt5QuickTest \
	Qt5QuickWidgets \
	Qt5Script \
	Qt5ScriptTools \
	Qt5Sensors \
	Qt5SerialBus \
	Qt5SerialPort \
	Qt5Sql \
	Qt5Svg \
	Qt5Test \
	Qt5UiPlugin \
	Qt5UiTools \
	Qt5WebChannel \
	Qt5WebKit \
	Qt5WebKitWidgets \
	Qt5WebSockets \
	Qt5Widgets \
	Qt5X11Extras \
	Qt5Xml \
	Qt5XmlPatterns
.for _p in ${_MODQT5_CMAKE_PKGS}
_MODQT5_SETUP +=	${_p}_DIR=${MODQT5_LIBDIR}/cmake
.endfor

MODQT5_LIB_DEPENDS = 	x11/qt5/qtbase,-main
MODQT_LIB_DEPENDS ?= 	${MODQT5_LIB_DEPENDS}

# qdoc, etc.
MODQT5_BUILD_DEPENDS = 	x11/qt5/qttools,-main
MODQT_BUILD_DEPENDS ?= 	${MODQT5_BUILD_DEPENDS}

MODQT_DEPS ?=		Yes
MODQT5_DEPS ?=		${MODQT_DEPS}
.if ${MODQT5_DEPS:L} == "yes"
LIB_DEPENDS += 		${MODQT5_LIB_DEPENDS}
BUILD_DEPENDS += 	${MODQT5_BUILD_DEPENDS}
.endif

CONFIGURE_ENV +=${_MODQT5_SETUP}
MAKE_ENV +=	${_MODQT5_SETUP}
MAKE_FLAGS +=	${_MODQT5_SETUP}

MODQT5_USE_GCC4_MODULE ?=	Yes
.if ${MODQT5_USE_GCC4_MODULE:L} == "yes"
# not really

COMPILER ?= gcc
ONLY_FOR_ARCHS ?= ${CXX11_ARCHS}
# force using compilers/wrappers from ${WRKDIR}/bin
# XXX LINK_C is actually unused by qmake

_MODQT5_SETUP +=	CC=cc CXX=c++ LINK_C=cc LINK=c++
.endif

.include "Makefile.version"

MODQT5_VERSION =	${QT5_VERSION}
MODQT5_WEBKIT_VERSION =	${QT5_WEBKIT_VERSION}
MODQT_VERSION ?=	${MODQT5_VERSION}

_MODQT5_PKGMATCH !=
show_deps: patch
	@cpkgs=$$(echo ${_MODQT5_CMAKE_PKGS:NQt5} | sed 's/ /|/g'); \
	find ${WRKSRC} \( -name '*.pr[iof]' -or -iname '*cmake*' \) -print0 | \
		xargs -0r egrep -hA 2 "\\<(qtHaveModule|QT_CONFIG|$$cpkgs)\\>|Qt5::"
