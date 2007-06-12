# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils toolchain-funcs

DESCRIPTION="uEmacs/PK is an enhanced version of MicroEMACS"
HOMEPAGE="ftp://ftp.cs.helsinki.fi/pub/Software/Local/uEmacs-PK"
SRC_URI="ftp://ftp.cs.helsinki.fi/pub/Software/Local/uEmacs-PK/em-${PV}.tar.gz"

LICENSE="free-noncomm"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"
PROVIDE="virtual/editor"

S="${WORKDIR}/em-${PV}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${P}-gentoo.patch
}

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" || die "emake failed"
}

src_install() {
	newbin emacs uemacs
	insinto /usr/share/${PN}
	doins emacs.hlp
	newins emacs.rc .emacsrc
	dodoc readme readme.39e emacs.ps
}
