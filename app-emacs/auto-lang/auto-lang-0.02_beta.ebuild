# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp

DESCRIPTION="Guess language of current buffer"
HOMEPAGE="http://www.emacswiki.org/cgi-bin/wiki/AutoLangMode"
# taken from: http://www.marquardt-home.de/auto-lang.el
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.el.bz2"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

SITEFILE="50${PN}-gentoo.el"
