# $OpenBSD: Makefile,v 1.11 2017/05/11 20:50:55 espie Exp $

BROKEN-alpha =		error "ISA not supported"

COMMENT =		collection of CTF tools

DISTNAME =		ctftools-0.1
REVISION =		5
GH_ACCOUNT =		jasperla
GH_PROJECT =		ctftools
GH_COMMIT =		c4a72ae4266a97407916728689568c7f747d0e4b
CATEGORIES =		devel

MAINTAINER =		Jasper Lievisse Adriaanse <jasper@openbsd.org>

# CDDL
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB +=		c dwarf elf pthread z

LIB_DEPENDS =		devel/libelf \
			devel/libdwarf>=20160613p0

WRKDIST =		${WRKDIR}/ctftools-${GH_COMMIT}
WRKSRC =		${WRKDIR}/ctftools-${GH_COMMIT}/cddl

do-configure:
	${SUBST_CMD} ${WRKSRC}/lib/libctf/Makefile \
	    ${WRKSRC}/usr.bin/ctfconvert/Makefile \
	    ${WRKSRC}/usr.bin/ctfdump/Makefile \
	    ${WRKSRC}/usr.bin/ctfmerge/Makefile

do-build:
	cd ${WRKSRC}/lib/libctf && ${MAKE_PROGRAM}
.for t in ctfconvert ctfdump ctfmerge
	cd ${WRKSRC}/usr.bin/$t && ${MAKE_PROGRAM}
.endfor

do-install:
.for t in ctfconvert ctfdump ctfmerge
	${INSTALL_PROGRAM} ${WRKSRC}/usr.bin/$t/$t ${PREFIX}/bin/
	${INSTALL_MAN} ${WRKSRC}/usr.bin/$t/$t.1 ${PREFIX}/man/man1
.endfor

.include <bsd.port.mk>
