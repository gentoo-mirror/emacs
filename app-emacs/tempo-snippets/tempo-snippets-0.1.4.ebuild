# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

NEED_EMACS=22.2

inherit elisp

DESCRIPTION="Visual insertion of tempo templates"
HOMEPAGE="http://nschum.de/src/emacs/tempo-snippets/
	http://www.emacswiki.org/cgi-bin/wiki/TempoSnippets"
#SRC_URI="mirror://gentoo/${P}.el.bz2"
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.el.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

SITEFILE=50${PN}-gentoo.el
