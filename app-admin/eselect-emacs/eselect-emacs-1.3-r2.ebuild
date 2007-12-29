# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Manages Emacs versions"
HOMEPAGE="http://www.gentoo.org/proj/en/lisp/emacs/"
SRC_URI="mirror://gentoo/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE=""

DEPEND=""
# Remove the blocker on emacs-updater when this goes into Portage
RDEPEND=">=app-admin/eselect-1.0.10
	!app-admin/emacs-updater"
# Now this should really be in RDEPEND, but it would result in blockers when
# updating from <=eselect-emacs-1.3. Leave it as PDEPEND for the time being.
PDEPEND="app-admin/eselect-ctags"

src_install() {
	insinto /usr/share/eselect/modules
	doins emacs.eselect || die "doins failed"
	doman emacs.eselect.5 || die "doman failed"
	dodoc ChangeLog || die "dodoc failed"
	dosbin "${FILESDIR}/emacs-updater" || die "dosbin failed"
}
