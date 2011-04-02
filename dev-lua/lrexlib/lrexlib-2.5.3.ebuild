# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit toolchain-funcs

DESCRIPTION="Lua binding of various regular expression library APIs"
HOMEPAGE="http://luaforge.net/projects/lrexlib/"
SRC_URI="http://luaforge.net/frs/download.php/4759/${P}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="oniguruma pcre tre"

RDEPEND=">=dev-lang/lua-5.1
	oniguruma? ( >=dev-libs/oniguruma-5.9.2 )
	pcre? ( >=dev-libs/libpcre-8.02 )
	tre? ( >=dev-libs/tre-0.8.0 )"
DEPEND="${RDEPEND}
	app-arch/unzip
	dev-util/pkgconfig"

src_compile() {
	REGNAMES="gnu posix"
	use oniguruma && REGNAMES="${REGNAMES} oniguruma"
	use pcre && REGNAMES="${REGNAMES} pcre"
	use tre && REGNAMES="${REGNAMES} tre"

	emake \
		CC="$(tc-getCC)" \
		LD="$(tc-getCC)" \
		MYCFLAGS="${CFLAGS} -fPIC" \
		LDFLAGS="${LDFLAGS} -shared" \
		REGNAMES="${REGNAMES}"
}

src_test() {
	make REGNAMES="${REGNAMES}" check
}

src_install() {
	local f dest=$(pkg-config --variable INSTALL_CMOD lua)
	exeinto "${dest}"

	for f in $(find . -type f -name "*.so.*"); do
		doexe ${f}
		f=${f##*/}
		dosym ${f} "${dest}/${f/%.so.*/.so}"
	done

	dodoc ChangeLog* NEWS README
	dohtml doc/*.html doc/*.css
}
