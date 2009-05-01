# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="An improved JavaScript mode for GNU Emacs"
HOMEPAGE="http://code.google.com/p/js2-mode/"
# taken from http://${PN}.googlecode.com/files/js2-${PV}.el"
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/js2-${PV}.el.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

SITEFILE="50${PN}-gentoo.el"

src_unpack() {
	unpack ${A}
	mv js2-${PV}.el ${PN}.el
}

pkg_postinst() {
	elisp-site-regen
	elog "If you want to activate js2-mode automatically for .js files,"
	elog "add the following command to your ~/.emacs file:"
	elog "(add-to-list 'auto-mode-alist '(\""'\\\\.js\\\\'"'\" . js2-mode))"
}
