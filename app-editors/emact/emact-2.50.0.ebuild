# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="EmACT - version of EMACS"
HOMEPAGE="http://www.eligis.com/"
SRC_URI="http://www.eligis.com/emacs/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="X"

DEPEND="sys-libs/ncurses
	X? (
		x11-libs/libX11
		x11-libs/libICE
		x11-libs/libSM
	)"

RDEPEND="${DEPEND}"
PROVIDE="virtual/editor"

src_compile() {
	econf $(use_with X x) || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	dodir /usr/bin /usr/share
	emake INSTALL="${D}"/usr install || die "emake install failed"
	dodoc README || die "dodoc failed"
}
