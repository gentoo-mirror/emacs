# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp eutils

DESCRIPTION="Mairix interface for Emacs"
HOMEPAGE="http://randomsample.de/mairix-el-doc/"
# taken from: http://randomsample.de/mairix.el
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.tar.bz2"

LICENSE="GPL-3 FDL-1.2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="net-mail/mairix"

SITEFILE=50${PN}-gentoo.el

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/${P}-info-dir-entry.patch"
	epatch "${FILESDIR}/${P}-vm-gentoo.patch"
}

src_compile() {
	elisp_src_compile
	makeinfo mairix-el.texi
}

src_install() {
	elisp_src_install
	doinfo mairix-el.info
}
