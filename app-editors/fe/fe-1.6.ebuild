# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Fe is a small and easy to use folding editor"
HOMEPAGE="http://www.moria.de/~michael/fe/"
SRC_URI="http://www.moria.de/~michael/fe/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"

src_install() {
	emake \
		prefix="${D}"/usr \
		datadir="${D}"/usr/share \
		MANDIR="${D}"/usr/share/man \
		install || die "emake install failed"
	dodoc NEWS README || die "dodoc failed"
}
