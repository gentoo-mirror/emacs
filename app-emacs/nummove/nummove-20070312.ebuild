# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

NEED_EMACS=22

inherit elisp eutils

DESCRIPTION="A graphical game of fifteen"
HOMEPAGE="http://www.emacswiki.org/cgi-bin/wiki/Nummove"
# taken from http://users.student.lth.se/f03kr/nummove.tar.gz
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/${PN}"
SITEFILE=50${PN}-gentoo.el

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/${P}-image-path.patch"
}

src_install() {
	elisp_src_install
	insinto "${SITEETC}/${PN}"
	doins [0-9]*.png || die
}
