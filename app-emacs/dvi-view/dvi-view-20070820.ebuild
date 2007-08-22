# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="View a DVI file in an Emacs buffer"
HOMEPAGE="http://lists.gnu.org/archive/html/gnu-emacs-sources/2007-08/msg00101.html"
SRC_URI="http://dev.gentoo.org/~ulm/${P}.el.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND=">=app-text/dvipng-1.8"
SIMPLE_ELISP=t
