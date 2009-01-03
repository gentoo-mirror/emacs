# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit elisp

DESCRIPTION="Mode for editing (and running) Maude programs in Emacs"
HOMEPAGE="http://maude-mode.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${PN}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/${PN}"
SITEFILE="50${PN}-gentoo.el"
DOCS="AUTHORS ChangeLog"
