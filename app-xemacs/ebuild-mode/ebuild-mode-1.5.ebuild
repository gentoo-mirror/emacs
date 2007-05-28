# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emacs/ebuild-mode/ebuild-mode-1.2.ebuild,v 1.1 2006/12/15 04:05:23 mkennedy Exp $

inherit xemacs-elisp eutils

DESCRIPTION="An Emacs mode for editing Portage .ebuild, .eclass and .eselect files."
HOMEPAGE="http://www.gentoo.org/proj/en/lisp/emacs/index.xml"
SRC_URI="mirror://gentoo/${P}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_unpack() {
	unpack "${A}"
	cd "${S}"
	epatch "${FILESDIR}"/autoloads.patch
	epatch "${FILESDIR}"/font-lock-keywords.patch
}
