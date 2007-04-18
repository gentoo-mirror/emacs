# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="GnuPG interface for Emacs"
HOMEPAGE="http://www.easypg.org/"
SRC_URI="mirror://sourceforge.jp/epg/24683/epg-${PV}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="app-crypt/gnupg"
RDEPEND="${DEPEND}"

SITEFILE=50easypg-gentoo.el

S=${WORKDIR}/epg-${PV}

src_compile(){
	econf
	emake||die "emake failed"
	elisp-make-autoload-file \
		|| die "elisp-make-autoload-file failed"
}

src_install() {
	einstall || die "einstall failed"

	elisp-install ${PN} ${PN}-autoloads.el
	elisp-site-file-install "${FILESDIR}/${SITEFILE}"
}

elisp_pkg_postinst() {
	elog "See the epa info page for more information"
	elisp-site-regen
}
