# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp

DESCRIPTION="A graphical game of fifteen"
HOMEPAGE="https://www.emacswiki.org/emacs/Nummove"
# taken from http://users.student.lth.se/f03kr/nummove.tar.gz
SRC_URI="https://dev.gentoo.org/~ulm/distfiles/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${PN}"
PATCHES=("${FILESDIR}"/${P}-image-path.patch)
SITEFILE="50${PN}-gentoo.el"

src_install() {
	elisp_src_install
	insinto "${SITEETC}/${PN}"
	doins [0-9]*.png
}
