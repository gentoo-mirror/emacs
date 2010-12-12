# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="library that implements user-interfaces for in-buffer completion"
HOMEPAGE="http://www.dr-qubit.org/emacs.php#completion"
# Upstream ships this as 0.11.8, but it contains version 0.11.10
SRC_URI="mirror://gentoo/${P}.tar.gz
		 http://dev.gentoo.org/~tomka/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/${PN}"

SITEFILE="50${PN}-gentoo.el"


pkg_postinst() {
	elisp-site-regen

	elog "This package ships completion for dabbrev, etags, elisp, "
	elog "files, semantic, and nxml.  You may want to bind the complete-? "
	elog "functions to a key in your .emacs file."
}

