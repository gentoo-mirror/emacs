# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp eutils

DESCRIPTION="Minibuffer input completion and cycling"
HOMEPAGE="http://www.emacswiki.org/cgi-bin/wiki/Icicles"
# taken from: http://www.emacswiki.org/cgi-bin/wiki/download/Icicles.zip
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

SITEFILE=50${PN}-gentoo.el

src_unpack() {
	unpack ${A}
	epatch "${FILESDIR}/${PN}-byte-compile-without-x.patch"
}

src_compile() {
	elisp-comp *.el || die "elisp-comp failed"
}
