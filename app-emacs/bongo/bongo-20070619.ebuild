# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

NEED_EMACS=22

inherit elisp eutils

DESCRIPTION="Buffer-oriented media player for Emacs"
HOMEPAGE="http://www.brockman.se/software/bongo/"
# Darcs snapshot of http://www.brockman.se/software/bongo/
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.tar.bz2"

LICENSE="GPL-2 FDL-1.2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-emacs/volume"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"
SITEFILE=50${PN}-gentoo.el
DOCS="NEWS README"

src_unpack() {
	unpack ${A}
	cd "${S}"

	# We need Emacs 22 for image-load-path anyway, so don't bother with 21.
	rm -f bongo-emacs21.el

	epatch "${FILESDIR}/${P}-fix-require.patch"
}

src_compile() {
	elisp_src_compile
	makeinfo bongo.texinfo || die "makeinfo failed"
}

src_install() {
	elisp_src_install

	insinto "${SITEETC}/${PN}"
	doins *.pbm *.png || die "doins failed"

	# needs additional dependencies Ruby-taglib and Mahoro
	#dobin tree-from-tags.rb || die "dobin failed"

	doinfo bongo.info || die "doinfo failed"
}
