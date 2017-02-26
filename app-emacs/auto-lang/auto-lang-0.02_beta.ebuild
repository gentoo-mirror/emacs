# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit elisp

DESCRIPTION="Guess language of current buffer"
HOMEPAGE="http://www.emacswiki.org/cgi-bin/wiki/AutoLangMode"
# taken from: http://www.marquardt-home.de/auto-lang.el
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.el.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

SITEFILE=50${PN}-gentoo.el
