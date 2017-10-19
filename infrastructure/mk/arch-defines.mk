# $OpenBSD: arch-defines.mk,v 1.44 2017/09/18 13:02:34 espie Exp $
#
# ex:ts=4 sw=4 filetype=make:
#
#	derived from bsd.port.mk in 2011
#	This file is in the public domain.
#	It is actually a part of bsd.port.mk that won't be included manually.
#

# architecture constants

ARCH ?!= uname -m

ALL_ARCHS = aarch64 alpha amd64 arm hppa i386 landisk loongson luna88k \
	m88k macppc mips64 mips64el octeon sgi socppc sparc64
# not all powerpc have apm(4), hence the use of macppc
APM_ARCHS = amd64 i386 loongson macppc sparc64
BE_ARCHS = hppa m88k mips64 powerpc sparc64
LE_ARCHS = aarch64 alpha amd64 arm i386 mips64el sh
LP64_ARCHS = aarch64 alpha amd64 sparc64 mips64 mips64el
GCC4_ARCHS = alpha arm armv7 hppa landisk loongson \
	macppc mips64 mips64el octeon powerpc sgi sh socppc sparc64
GCC3_ARCHS = luna88k m88k
# XXX easier for ports that depend on mono
MONO_ARCHS = amd64 i386
OCAML_NATIVE_ARCHS = i386 amd64
OCAML_NATIVE_DYNLINK_ARCHS = i386 amd64
GO_ARCHS = amd64 i386

# arches where the base compiler is clang
CLANG_ARCHS = aarch64 amd64 i386
# arches using LLVM's linker (ld.lld); others use binutils' ld.bfd
LLD_ARCHS = aarch64

# arches where ports devel/llvm builds - populates llvm ONLY_FOR_ARCHS
# as well as available for PROPERTIES checks.  XXX list currently inaccurate
LLVM_ARCHS = aarch64 amd64 arm i386 powerpc mips64 mips64el sparc64
# arches where gcc4.9 exists.  To be used again for modules
GCC49_ARCHS =amd64 arm hppa i386 mips64 mips64el powerpc sparc64

# arches where there is a C++11 compiler, either clang in base or gcc4
CXX11_ARCHS = ${CLANG_ARCHS} ${GCC49_ARCHS}

.for PROP in ALL APM BE LE LP64 CLANG GCC4 GCC3 GCC49 MONO LLVM \
                     CXX11 OCAML_NATIVE OCAML_NATIVE_DYNLINK GO LLD
.  for A B in ${MACHINE_ARCH} ${ARCH}
.    if !empty(${PROP}_ARCHS:M$A) || !empty(${PROP}_ARCHS:M$B)
PROPERTIES += ${PROP:L}
.    endif
.  endfor
.endfor

.if ${PROPERTIES:Mclang}
LIBCXX = c++ c++abi pthread
LIBECXX = c++ c++abi pthread
.else
LIBCXX = stdc++ pthread
LIBECXX = estdc++>=17 pthread
.endif

# system version wide specifics
_SYSTEM_VERSION = 0
_SYSTEM_VERSION-i386 = 1
_SYSTEM_VERSION-amd64 = 1
_SYSTEM_VERSION-${MACHINE_ARCH} ?= 0
_SYSTEM_VERSION-${ARCH} ?= 0

_PKG_ARGS_VERSION += -V ${_SYSTEM_VERSION} -V ${_SYSTEM_VERSION-${MACHINE_ARCH}}
.if ${ARCH} != ${MACHINE_ARCH}
_PKG_ARGS_VERSION += -V ${_SYSTEM_VERSION-${ARCH}}
.endif

