# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

NEED_EMACS=22

inherit elisp

MY_PV=${PV:0:4}-${PV:4:2}-${PV:6}
DESCRIPTION="In-buffer completion front-end"
HOMEPAGE="http://nschum.de/src/emacs/company-mode/"
SRC_URI="http://nschum.de/src/emacs/${PN}/${PN}-${MY_PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

SITEFILE=50${PN}-gentoo.el

src_compile() {
	elisp-comp *.el || die "elisp-comp failed"
}
