# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="Unified user interface for Emacs folding modes"
HOMEPAGE="http://www.dur.ac.uk/p.j.heslin/Software/Emacs/"
SRC_URI="http://dev.gentoo.org/~ulm/${P}.el.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

SIMPLE_ELISP=t
SITEFILE=50${PN}-gentoo.el