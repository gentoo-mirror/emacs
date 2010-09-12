# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
EGIT_REPO_URI="git://git.kernel.org/pub/scm/editors/uemacs/uemacs.git"

inherit git toolchain-funcs

DESCRIPTION="Linus Torvalds' Microemacs, a fork of uEmacs/PK"
HOMEPAGE="http://git.kernel.org/?p=editors/uemacs/uemacs.git;a=summary"
SRC_URI=""

LICENSE="free-noncomm"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e "s:/usr/lib/:/usr/share/${PN}/:" epath.h || die
	# Respect LDFLAGS when linking
	sed -i -e 's/\(\$(CC) \$(DEFINES)\) \(-o \$@\)/\1 $(LDFLAGS) \2/' \
		Makefile || die
}

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" || die
}

src_install() {
	dobin em || die
	insinto /usr/share/${PN}
	doins emacs.hlp || die
	newins emacs.rc .emacsrc || die
	dodoc README readme.39e emacs.ps
}
