# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="Predefined configurations for app-emacs/anything"
HOMEPAGE="http://www.emacswiki.org/emacs/anything-config.el"
SRC_URI="http://dev.gentoo.org/~fauli/distfiles/${P}.el.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

SITEFILE=50${PN}-gentoo.el

DEPEND="app-emacs/anything"
RDEPEND="${DEPEND}"
