# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp eutils

DESCRIPTION="View a DVI file in an Emacs buffer"
HOMEPAGE="http://www.emacswiki.org/cgi-bin/wiki/DviViewMode"
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.el.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND=">=app-text/dvipng-1.8"

SITEFILE=50${PN}-gentoo.el

src_unpack() {
	elisp_src_unpack
	epatch "${FILESDIR}/${P}-evenp.patch"
}
