# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="Show Common Lisp operators and variables information in echo area"
HOMEPAGE="http://homepage1.nifty.com/bmonkey/lisp/index-en.html"
# taken from http://homepage1.nifty.com/bmonkey/emacs/elisp/cldoc.el
SRC_URI="http://dev.gentoo.org/~ulm/${P}.el.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

SIMPLE_ELISP=t
SITEFILE=50${PN}-gentoo.el
