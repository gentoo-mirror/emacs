# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion

DESCRIPTION="Rebuild Emacs packages"
HOMEPAGE="http://www.gentoo.org/proj/en/lisp/emacs/"
#SRC_URI="mirror://gentoo/${P}.tar.bz2"
ESVN_REPO_URI="svn://anonsvn.gentoo.org/emacs/${PN}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE=""

DEPEND=""
RDEPEND="!<=app-admin/eselect-emacs-1.5
	>=app-portage/portage-utils-0.1.28
	virtual/emacs"

S="${WORKDIR}/${PN}"

src_install() {
	dosbin emacs-updater || die "dosbin failed"
	doman emacs-updater.8 || die "doman failed"
}
