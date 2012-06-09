# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

EGIT_REPO_URI="git://git.overlays.gentoo.org/proj/emacs-tools.git"
EGIT_BRANCH="${PN}"

inherit elisp git-2

DESCRIPTION="Emacs modes for editing ebuilds and other Gentoo specific files"
HOMEPAGE="http://www.gentoo.org/proj/en/lisp/emacs/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
IUSE=""

DOCS="ChangeLog"
SITEFILE="50${PN}-gentoo.el"
ELISP_TEXINFO="${PN}.texi"

src_install() {
	elisp-install ${PN} *.el *.elc || die
	sed -e "s:@PORTDIR@:${PORTDIR}:" \
		"${FILESDIR}/${SITEFILE}" >"${T}/${SITEFILE}" || die
	elisp-site-file-install "${T}/${SITEFILE}" || die
	doinfo gentoo-syntax.info
	dodoc ${DOCS}
}

pkg_postinst() {
	elisp-site-regen

	elog "Some optional features may require installation of additional"
	elog "packages, like app-portage/gentoolkit-dev for echangelog."
}
