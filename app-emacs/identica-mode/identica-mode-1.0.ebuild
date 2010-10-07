# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="Identi.ca mode for Emacs"
HOMEPAGE="http://blog.nethazard.net/identica-mode-for-emacs/"
# taken from: http://git.savannah.gnu.org/cgit/identica-mode.git/snapshot/${P}.tar.gz
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.tar.gz"

LICENSE="GPL-2 FDL-1.2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ELISP_PATCHES="${P}-texi-nodes.patch"
ELISP_TEXINFO="doc/${PN}.texi"
SITEFILE="50${PN}-gentoo.el"

src_compile() {
	elisp-compile ${PN}.el || die
	cd doc
	makeinfo ${PN}.texi || die
}
