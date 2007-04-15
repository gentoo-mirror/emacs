# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Manages the /usr/bin/emacs symlink"
HOMEPAGE="http://www.gentoo.org/"
SRC_URI="mirror://gentoo/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND=">=app-admin/eselect-1.0.7"

src_install() {
	insinto /usr/share/eselect/modules
	doins emacs.eselect || die "doins failed"
	doman emacs.eselect.5 || die "doman failed"
}
