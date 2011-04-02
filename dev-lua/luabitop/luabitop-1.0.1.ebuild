# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit toolchain-funcs

MY_P="LuaBitOp-${PV}"
DESCRIPTION="C extension module for Lua which adds bitwise operations on numbers"
HOMEPAGE="http://bitop.luajit.org/"
SRC_URI="http://bitop.luajit.org/download/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-lang/lua-5.1"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

S="${WORKDIR}/${MY_P}"

src_compile() {
	emake \
		CC="$(tc-getCC)" \
		CFLAGS="${CFLAGS} -fPIC" \
		SOCCFLAGS="${LDFLAGS} -fPIC"
}

src_install() {
	exeinto "$(pkg-config --variable INSTALL_CMOD lua)"
	doexe bit.so
	dodoc README
	dohtml -r doc/.
}
