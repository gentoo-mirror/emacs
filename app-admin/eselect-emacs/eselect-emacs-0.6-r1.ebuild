# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils fdo-mime

DESCRIPTION="Manages the /usr/bin/emacs symlink"
HOMEPAGE="http://www.gentoo.org/"
#SRC_URI="mirror://gentoo/${P}.tar.bz2"
SRC_URI="http://wwwa1.kph.uni-mainz.de/users/ulm/gentoo/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="X"

RDEPEND=">=app-admin/eselect-1.0.7"

src_unpack() {
	unpack "${A}"
	cd "${S}"
	patch <<EOF
Index: emacs.eselect
187c187
< 		true
---
> 		remove_symlinks || die -q "Couldn't remove existing symlink"
212a213
> 		remove_symlinks || die -q "Couldn't remove existing symlink"
EOF
}

src_install() {
	if use X; then
		domenu emacs.desktop emacsclient.desktop
		doicon emacs.png
	fi
	insinto /usr/share/eselect/modules
	doins emacs.eselect || die "doins failed"
}

pkg_postinst() {
	use X && fdo-mime_desktop_database_update
}

pkg_postrm() {
	use X && fdo-mime_desktop_database_update
}
