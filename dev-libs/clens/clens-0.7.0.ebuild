# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils multilib toolchain-funcs

DESCRIPTION="Convenience library to aid in porting OpenBSD code to other OSes"
HOMEPAGE="https://opensource.conformal.com/wiki/clens"
SRC_URI="https://opensource.conformal.com/snapshots/${PN}/${P}.tar.gz"

LICENSE="ISC BSD BSD-4"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_prepare() {
	epatch "${FILESDIR}"/${P}-no-arc4random.patch
	tc-export CC AR
}

src_install() {
	emake DESTDIR="${D}" \
		LOCALBASE="/usr" \
		LIBDIR="/usr/$(get_libdir)" \
		install
}
