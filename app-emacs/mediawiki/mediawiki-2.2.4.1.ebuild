# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit elisp

DESCRIPTION="MediaWiki client for Emacs"
HOMEPAGE="https://launchpad.net/mediawiki-el"
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.el.xz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-arch/xz-utils"

SITEFILE="50${PN}-gentoo.el"
