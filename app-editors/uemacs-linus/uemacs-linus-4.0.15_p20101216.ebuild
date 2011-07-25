# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit toolchain-funcs

DESCRIPTION="Linus Torvalds' Microemacs, a fork of uEmacs/PK"
HOMEPAGE="http://git.kernel.org/?p=editors/uemacs/uemacs.git;a=summary"
# snapshot from git repo
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/uemacs-${PV}.tar.bz2"

LICENSE="free-noncomm"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"

S="${WORKDIR}/uemacs"

src_prepare() {
	sed -i -e "s:/usr/lib/:/usr/share/${PN}/:" epath.h || die
	# Respect LDFLAGS when linking
	sed -i -e 's/\(\$(CC) \$(DEFINES)\) \(-o \$@\)/\1 $(LDFLAGS) \2/' \
		Makefile || die
}

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}"
}

src_install() {
	dobin em
	insinto /usr/share/${PN}
	doins emacs.hlp
	newins emacs.rc .emacsrc
	dodoc README readme.39e emacs.ps UTF-8-demo.txt
}
