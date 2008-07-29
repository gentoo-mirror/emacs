# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp eutils

MY_P=${PN}-el_${PV}
DESCRIPTION="Mairix interface for Emacs"
HOMEPAGE="http://randomsample.de/mairix-el-doc/"
SRC_URI="http://randomsample.de/${MY_P}.tar.gz"

LICENSE="GPL-3 FDL-1.2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="net-mail/mairix"

S="${WORKDIR}/${MY_P}"
SITEFILE=50${PN}-gentoo.el

src_install() {
	elisp_src_install
	doinfo mairix-el.info
}
