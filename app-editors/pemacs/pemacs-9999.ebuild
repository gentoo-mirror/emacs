# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit toolchain-funcs

if [[ ${PV} = 9999 ]]; then
	EGIT_REPO_URI="https://github.com/hughbarney/pEmacs.git"
	EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"
	inherit git-r3
else
	# snapshot from git repo
	SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.tar.xz"
fi

DESCRIPTION="Perfect Emacs, a small footprint Emacs derived from Ersatz Emacs"
HOMEPAGE="https://github.com/hughbarney/pEmacs"

LICENSE="public-domain"
SLOT="0"

RDEPEND="sys-libs/ncurses"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

S="${WORKDIR}/${PN}"

src_compile() {
	emake CC="$(tc-getCC)" \
		CFLAGS="${CFLAGS} -Wall" \
		LFLAGS="${LDFLAGS} $("$(tc-getPKG_CONFIG)" --libs ncurses)"
}

src_install() {
	dobin pe
	doman pe.1
	dodoc README.md
}
