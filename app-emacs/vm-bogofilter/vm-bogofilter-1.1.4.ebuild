# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

inherit elisp

DESCRIPTION="An interface between the VM mail reader and the bogofilter spam filter"
HOMEPAGE="http://www.cis.upenn.edu/~bjornk/"
SRC_URI="http://www.cis.upenn.edu/~bjornk/bogofilter/${PN}.el-${PV}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=app-emacs/vm-7.19-r3"
RDEPEND="${DEPEND}
	mail-filter/bogofilter"

SITEFILE=50${PN}-gentoo.el

src_unpack() {
	cp "${DISTDIR}/${PN}.el-${PV}" ${PN}.el || die
}

pkg_postinst() {
	elisp-site-regen
	elog "Add the following line to your ~/.vm file to enable vm-bogofilter:"
	elog "  (require 'vm-bogofilter)"
	elog "See ${SITELISP}/${PN}/${PN}.el for the complete documentation."
}
