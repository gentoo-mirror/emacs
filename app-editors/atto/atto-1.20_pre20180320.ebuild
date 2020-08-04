# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

COMMIT="1485816cc8e7556c634d2676b3ff17c3b998062a"
DESCRIPTION="The smallest functional Emacs in less than 2000 lines of C"
HOMEPAGE="https://github.com/hughbarney/atto"
SRC_URI="https://github.com/hughbarney/${PN}/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="sys-libs/ncurses:0="
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${COMMIT}"

src_compile() {
	emake CC="$(tc-getCC)" \
		CFLAGS="${CFLAGS}" \
		LD="$(tc-getCC) ${LDFLAGS}" \
		LIBS="$("$(tc-getPKG_CONFIG)" --libs ncursesw)"
}

src_install() {
	dobin atto
	dodoc README.md CHANGE.LOG.md docs/*.txt
}
