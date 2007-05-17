# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="Look up conversational and computing acronyms"
HOMEPAGE="http://centaur.maths.qmw.ac.uk/Emacs/"
# taken from: http://mwolson.org/static/dist/wtf/wtf.el
SRC_URI="http://wwwa1.kph.uni-mainz.de/users/ulm/distfiles/${P}.el.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="offensive"

SIMPLE_ELISP=t
SITEFILE=50${PN}-gentoo.el

pkg_setup() {
	use offensive || die "You need USE=offensive to emerge"
}
