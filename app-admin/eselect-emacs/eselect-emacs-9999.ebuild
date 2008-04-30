# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion

DESCRIPTION="Manages Emacs versions"
HOMEPAGE="http://www.gentoo.org/proj/en/lisp/emacs/"
#SRC_URI="mirror://gentoo/${P}.tar.bz2"
ESVN_REPO_URI="svn://anonsvn.gentoo.org/emacs/${PN}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE=""

DEPEND=""
RDEPEND=">=app-admin/eselect-1.0.10
	~app-admin/eselect-ctags-${PV}"

S="${WORKDIR}/${PN}"

src_unpack() {
	subversion_fetch || die
	subversion_fetch "${ESVN_REPO_URI%/*}/emacs-updater" || die
}

src_install() {
	insinto /usr/share/eselect/modules
	doins emacs.eselect || die "doins failed"
	newins {c,e}tags.eselect || die "newins failed"
	dosed "/^CTAGS=/s/ctags/etags/" ${INSDESTTREE}/etags.eselect

	doman emacs.eselect.5 || die "doman failed"
	newman {c,e}tags.eselect.5 || die "newman failed"

	dodoc ChangeLog || die "dodoc failed"
	dosbin emacs-updater || die "dosbin failed"
}
