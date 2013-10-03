# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit toolchain-funcs

DESCRIPTION="Convenience library to aid in porting code from OpenBSD"
HOMEPAGE="https://opensource.conformal.com/wiki/clens"
SRC_URI="https://opensource.conformal.com/snapshots/${PN}/${P}.tar.gz"

LICENSE="ISC BSD BSD-4"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="arc4random"

DEPEND="arc4random? ( dev-libs/libbsd )"
RDEPEND="${DEPEND}"

src_prepare() {
	if ! use arc4random; then
		sed -i -e "s/arc4random[^.]*\.c//" GNUmakefile || die
	fi
	tc-export CC AR
}

src_install() {
	emake LOCALBASE=/usr DESTDIR="${ED}" install
}
