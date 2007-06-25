# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

NEED_EMACS=22

inherit elisp

DESCRIPTION="Emacs client API for del.icio.us"
HOMEPAGE="http://www.wjsullivan.net/delicious-el.html"
SRC_URI="http://www.wjsullivan.net/darcs/delicious-el/delicious-el-${PV}.tar.gz"

LICENSE="GPL-2"
IUSE="planner"
KEYWORDS="~x86"

SLOT="0"

DEPEND="planner? ( app-emacs/planner )"

SITEFILE=50${PN}-gentoo.el
DOCS="README"

S="${WORKDIR}/${PN}-el"

src_compile() {
	local FILES="delicioapi.el delicious.el"
	use planner && FILES="${FILES} planner-delicious.el"
	elisp-comp ${FILES} || die "elisp-comp failed"
}
