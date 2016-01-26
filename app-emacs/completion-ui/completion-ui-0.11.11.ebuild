# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4

inherit elisp

DESCRIPTION="Library that implements user-interfaces for in-buffer completion"
HOMEPAGE="http://www.dr-qubit.org/emacs.php#completion"
SRC_URI="http://www.dr-qubit.org/predictive/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/${PN}"
SITEFILE="50${PN}-gentoo.el"

pkg_postinst() {
	elisp-site-regen

	elog "This package ships completion for dabbrev, etags, elisp,"
	elog "files, semantic, and nxml.  You may want to bind the complete-?"
	elog "functions to a key in your .emacs file."
}
