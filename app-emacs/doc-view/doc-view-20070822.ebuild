# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

NEED_EMACS=22

inherit elisp

DESCRIPTION="View PDF/PostStript/DVI files in Emacs"
HOMEPAGE="http://www.tsdh.de"
SRC_URI="http://dev.gentoo.org/~ulm/${P}.el.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND=">=media-gfx/imagemagick-6.3.3"
SIMPLE_ELISP=t
