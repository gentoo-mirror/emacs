# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emacs/edb/edb-1.25.ebuild,v 1.2 2005/09/04 03:02:14 swegener Exp $

inherit elisp eutils versionator

MY_PV=$(delete_version_separator 2)
DESCRIPTION="EDB, The Emacs Database"
HOMEPAGE="http://www.gnuvola.org/software/edb/"
SRC_URI="http://www.gnuvola.org/software/edb/${PN}-${MY_PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~sparc ~amd64 ~ppc"
IUSE=""

S="${WORKDIR}/${PN}-${MY_PV}"
SITEFILE="51${PN}-gentoo.el"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/edb-info-direntry.patch"
}

src_compile() {
	econf || die "econf failed"
	emake -j1 || die "emake failed"
}

src_install() {
	einstall sitelisp="${D}${SITELISP}" || die "einstall failed"
	elisp-site-file-install "${FILESDIR}/${SITEFILE}"
	dodoc AUTHORS BUGS ChangeLog HACKING NEWS README TODO || die "dodoc failed"
	cp -R examples "${D}"/usr/share/doc/${PF}/
}
