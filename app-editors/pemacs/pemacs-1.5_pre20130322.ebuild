# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

if [[ ${PV} = 9999 ]]; then
	EGIT_REPO_URI="https://github.com/hughbarney/pEmacs.git"
	EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"
	inherit git-r3
else
	# snapshot from git repo
	SRC_URI="https://dev.gentoo.org/~ulm/distfiles/${P}.tar.xz"
fi

DESCRIPTION="Perfect Emacs, a small footprint Emacs derived from Ersatz Emacs"
HOMEPAGE="https://github.com/hughbarney/pEmacs"
S="${WORKDIR}/${PN}"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="sys-libs/ncurses:0="
DEPEND="${RDEPEND}
	virtual/pkgconfig"

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
