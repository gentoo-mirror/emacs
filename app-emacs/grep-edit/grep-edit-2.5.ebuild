# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="An improved interface to grep for editing"
HOMEPAGE="http://www.bookshelf.jp/"
# taken from http://www.bookshelf.jp/elc/grep-edit.el
SRC_URI="http://gentoo.panicode.com/distfiles/${P}.el.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

SIMPLE_ELISP=t
SITEFILE="50${PN}-gentoo.el"

pkg_postinst() {
	elog "To activate grep-edit, add the following line to your ~/.emacs file:"
	elog "   (require 'grep-edit)"
}
