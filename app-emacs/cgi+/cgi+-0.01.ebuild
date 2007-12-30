# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="Run CGI inside Emacs"
HOMEPAGE="http://www.emacswiki.org/cgi-bin/wiki/cgi%2B.el"
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.el.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-emacs/httpd
	app-emacs/cgi"
RDEPEND="${DEPEND}"

SIMPLE_ELISP=t
SITEFILE=50${PN}-gentoo.el
