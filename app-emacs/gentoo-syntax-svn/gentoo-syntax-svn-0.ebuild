# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emacs/gentoo-syntax/gentoo-syntax-1.6-r1.ebuild,v 1.3 2007/06/25 17:07:53 opfer Exp $

inherit elisp subversion

ESVN_REPO_URI="http://overlays.gentoo.org/svn/proj/emacs/emacs-extra/gentoo-syntax/"
DESCRIPTION="Emacs modes for editing ebuilds and other Gentoo specific files"
HOMEPAGE="http://www.gentoo.org/proj/en/lisp/emacs/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="!app-emacs/gentoo-syntax"

SITEFILE=51gentoo-syntax-gentoo.el

src_install() {
	elisp-install gentoo-syntax *.el *.elc || die "elisp-install failed"
	elisp-site-file-install "${FILESDIR}/${SITEFILE}" gentoo-syntax \
		|| die "elisp-site-file-install failed"
	dodoc ChangeLog
}

pkg_postinst() {
	elisp-site-regen

	elog "Some optional features may require installation of additional"
	elog "packages, like app-portage/gentoolkit-dev for echangelog."
}
