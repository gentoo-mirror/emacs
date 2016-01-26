# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit elisp

DESCRIPTION="A graphical game of fifteen"
HOMEPAGE="http://www.emacswiki.org/cgi-bin/wiki/Nummove"
# taken from http://users.student.lth.se/f03kr/nummove.tar.gz
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${PN}"
ELISP_PATCHES="${P}-image-path.patch"
SITEFILE="50${PN}-gentoo.el"

src_install() {
	elisp_src_install
	insinto "${SITEETC}/${PN}"
	doins [0-9]*.png
}
