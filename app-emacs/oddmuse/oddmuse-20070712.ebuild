# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="Edit pages on an Oddmuse wiki using curl"
HOMEPAGE="http://www.emacswiki.org/cgi-bin/wiki/OddmuseMode"
# taken from: http://www.emacswiki.org/cgi-bin/emacs/download/${PN}.el
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.el.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="net-misc/curl"

SITEFILE=50${PN}-gentoo.el
