# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="A Javascript-mode for GNU Emacs"
HOMEPAGE="http://www.nongnu.org/espresso/"
# taken from http://download.savannah.gnu.org/releases-noredirect/espresso/espresso.el
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.el.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

SITEFILE="50${PN}-gentoo.el"
