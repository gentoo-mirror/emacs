# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="fit a frame to its buffer"
HOMEPAGE="http://www.emacswiki.org/emacs/Anything"
SRC_URI="http://dev.gentoo.org/~fauli/distfiles/${P}.el.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-emacs/fit-frame"
RDEPEND="${DEPEND}"
