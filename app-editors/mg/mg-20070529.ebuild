# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Micro GNU/emacs, a port from the BSDs"
HOMEPAGE="http://www.xs4all.nl/~hanb/software/mg/"
SRC_URI="http://www.xs4all.nl/~hanb/software/mg/${P}.tar.gz"
LICENSE="public-domain"

SLOT="0"
KEYWORDS="~x86"

IUSE=""
DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	# econf won't work, as this script does not accept any parameters
	./configure || die "econf failed"
	emake CFLAGS="${CFLAGS}" || die "emake failed"
}

src_install()  {
	einstall || die "einstall failed"
}
