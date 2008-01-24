# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="An improved interface to kill-ring"
HOMEPAGE="http://www.todesschaf.org/projects/bkr.html"
# taken from http://www.todesschaf.org/files/browse-kill-ring.el
SRC_URI="http://gentoo.panicode.com/distfiles/${P}.el.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

SIMPLE_ELISP=t
SITEFILE="50${PN}-gentoo.el"

