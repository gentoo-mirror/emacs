# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="Fast file finder for Emacs"
HOMEPAGE="http://www.splode.com/~friedman/software/emacs-lisp/"
SRC_URI="http://wwwa1.kph.uni-mainz.de/users/ulm/distfiles/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="|| ( >=sys-apps/slocate-2.7-r8
		sys-apps/mlocate )"

SITEFILE=50${PN}-gentoo.el

src_compile() {
	elisp-comp *.el || die "elisp-comp failed"
}
