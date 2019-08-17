# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://git.kernel.org/pub/scm/editors/uemacs/uemacs.git"
EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"
inherit git-r3 toolchain-funcs

DESCRIPTION="uEmacs/PK is an enhanced version of MicroEMACS"
HOMEPAGE="https://git.kernel.org/?p=editors/uemacs/uemacs.git;a=summary
	ftp://ftp.cs.helsinki.fi/pub/Software/Local/uEmacs-PK"

LICENSE="free-noncomm"
SLOT="0"

RDEPEND="sys-libs/ncurses:0="
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

S="${WORKDIR}/${PN}"

src_compile() {
	emake V=1 \
		CC="$(tc-getCC)" \
		CFLAGS="${CFLAGS}" \
		LDFLAGS="${LDFLAGS}" \
		LIBS="$("$(tc-getPKG_CONFIG)" --libs ncurses)"
}

src_install() {
	dobin em
	insinto /usr/share/${PN}
	doins emacs.hlp
	newins emacs.rc .emacsrc
	dodoc README readme.39e emacs.ps UTF-8-demo.txt
}
