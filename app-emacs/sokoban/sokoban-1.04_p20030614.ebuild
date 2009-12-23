# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="Implementation of Sokoban for Emacs"
HOMEPAGE="http://www.xemacs.org/Develop/packages.html"
# taken from: http://alioth.debian.org/scm/viewvc.php/XEmacs/packages/xemacs-packages/games/?root=xemacs
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/${PN}"
SITEFILE="50${PN}-gentoo.el"

src_install() {
	elisp_src_install
	insinto "${SITEETC}/${PN}"
	doins sokoban.levels || die
}
