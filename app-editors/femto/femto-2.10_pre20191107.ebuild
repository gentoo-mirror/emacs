# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

COMMIT="282ca3c04dba54f180021388102c2e319300cd07"
DESCRIPTION="Extended version of Atto Emacs with a Tiny Lisp extension language"
HOMEPAGE="https://github.com/hughbarney/femto"
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
		LD="$(tc-getCC)" \
		LDFLAGS="${LDFLAGS} -o" \
		LIBS="$("$(tc-getPKG_CONFIG)" --libs ncursesw)"
}

src_install() {
	dobin femto
	dodoc README*.md CHANGE.LOG.md docs/*.txt docs/hltest.c
	dodoc -r examples
}
