# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion

ESVN_REPO_URI="http://overlays.gentoo.org/svn/proj/emacs/emacs-extra/${PN}/"
DESCRIPTION="Find site-initialisation files in deprecated location"
HOMEPAGE="http://www.gentoo.org/proj/en/lisp/emacs/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="app-portage/portage-utils"

src_install() {
	dosbin emacs-updater
	dodoc ChangeLog
}
