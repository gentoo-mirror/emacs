# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="Yet another snippet extension for Emacs"
HOMEPAGE="http://code.google.com/p/yasnippet/"
SRC_URI="http://yasnippet.googlecode.com/files/${P}.tar.bz2
	doc? ( http://yasnippet.googlecode.com/files/${PN}-doc-${PV}.tar.bz2 )"

# Homepage says MIT licence, source contains GPL-2 copyright notice
LICENSE="MIT GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

SITEFILE=50${PN}-gentoo.el

src_install() {
	elisp_src_install

	insinto "${SITEETC}/${PN}"
	doins -r snippets || die "doins failed"

	if use doc; then
		dohtml -r "${WORKDIR}"/doc/* || die "dohtml failed"
	fi
}

pkg_postinst() {
	elisp-site-regen

	elog "Please add the following code into your .emacs to use yasnippet:"
	elog "(yas/initialize)"
	elog "(yas/load-directory \"${SITEETC}/${PN}/snippets\")"
}
