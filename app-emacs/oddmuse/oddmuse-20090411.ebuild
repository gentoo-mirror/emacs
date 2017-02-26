# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit elisp

DESCRIPTION="Edit pages on an Oddmuse wiki"
HOMEPAGE="http://www.emacswiki.org/cgi-bin/wiki/OddmuseMode"
# taken from: http://bzr.savannah.gnu.org/r/oddmuse-el/trunk
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.el.bz2"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

SITEFILE="50${PN}-gentoo.el"
