# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="Drop-down menu interface"
HOMEPAGE="http://www.emacswiki.org/cgi-bin/wiki/dropdown-list.el"
#SRC_URI="mirror://gentoo/${P}.el.bz2"
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.el.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

SITEFILE=50${PN}-gentoo.el
