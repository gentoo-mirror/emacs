# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4

inherit elisp

DESCRIPTION="Extensions to diff-mode.el"
HOMEPAGE="http://emacswiki.org/emacs/diff-mode-.el"
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.el.xz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/xz-utils"

SITEFILE="50${PN}-gentoo.el"

pkg_postinst() {
	elisp-site-regen
	elog "This library should be loaded *before* library diff-mode.el."
	elog "Put this in your initialization file, ~/.emacs:"
	elog "  (require 'diff-mode-)"
}
