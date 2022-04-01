# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp

DESCRIPTION="Guess language of current buffer"
HOMEPAGE="https://www.emacswiki.org/emacs/AutoLangMode"
# taken from: http://www.marquardt-home.de/auto-lang.el
SRC_URI="https://dev.gentoo.org/~ulm/distfiles/${P}.el.bz2"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

SITEFILE="50${PN}-gentoo.el"
