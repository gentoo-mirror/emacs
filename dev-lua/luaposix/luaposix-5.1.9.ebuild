# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit toolchain-funcs

DESCRIPTION="POSIX library for lua"
HOMEPAGE="http://luaforge.net/projects/luaposix/"
SRC_URI="http://luaforge.net/frs/download.php/4808/${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="test"

RDEPEND=">=dev-lang/lua-5.1"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

S="${WORKDIR}/${PN}"

src_compile() {
	emake \
		CC="$(tc-getCC)" \
		PREFIX="/usr"
}

src_install() {
	emake DESTDIR="${D}" \
		LUALIB="$(pkg-config --variable INSTALL_CMOD lua)" \
		install
	dodoc README
}
