# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit elisp

DESCRIPTION="TECO interpreter for GNU Emacs"
HOMEPAGE="http://www.emacswiki.org/emacs/TecoInterpreterInElisp"
# taken from: http://www.emacswiki.org/emacs/teco.el
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.el.bz2"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ELISP_PATCHES="${P}-minibuffer-prompt.patch"
SITEFILE="50${PN}-gentoo.el"

pkg_postinst() {
	elisp-site-regen
	elog "To be able to invoke Teco directly, define a key binding"
	elog "for teco:command in your ~/.emacs file, e.g.:"
	elog "  (global-set-key \"\\C-z\" 'teco:command)"
	elog "See ${SITELISP}/${PN}/teco.el for documentation."
}
