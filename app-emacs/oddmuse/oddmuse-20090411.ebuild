# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp

DESCRIPTION="Edit pages on an Oddmuse wiki"
HOMEPAGE="https://www.emacswiki.org/emacs/OddmuseMode"
# taken from: http://bzr.savannah.gnu.org/r/oddmuse-el/trunk
SRC_URI="https://dev.gentoo.org/~ulm/distfiles/${P}.el.bz2"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

SITEFILE="50${PN}-gentoo.el"
