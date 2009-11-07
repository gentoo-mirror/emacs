# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion

DESCRIPTION="Manage multiple Emacs versions on one system"
HOMEPAGE="http://www.gentoo.org/proj/en/lisp/emacs/"
#SRC_URI="mirror://gentoo/${P}.tar.bz2"
ESVN_REPO_URI="svn://anonsvn.gentoo.org/emacs/${PN}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE=""

DEPEND=""
RDEPEND=">=app-admin/eselect-1.2.6
	~app-admin/eselect-ctags-${PV}"

S="${WORKDIR}/${PN}"

src_install() {
	insinto /usr/share/eselect/modules
	doins {emacs,etags}.eselect || die "doins failed"
	doman {emacs,etags}.eselect.5 || die "doman failed"
	dodoc ChangeLog || die "dodoc failed"
}
