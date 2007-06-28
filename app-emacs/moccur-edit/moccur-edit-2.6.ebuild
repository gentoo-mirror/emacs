# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="An improved interface to color-moccur for editing"
HOMEPAGE="http://www.bookshelf.jp/"
SRC_URI="http://gentoo.panicode.com/distfiles/${P}.el.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RDEPEND="app-emacs/color-moccur"
DEPEND="${RDEPEND}"

SIMPLE_ELISP=t
SITEFILE="60${PN}-gentoo.el"

