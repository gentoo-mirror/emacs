# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp eutils

DESCRIPTION="Interface to web translation services such as Babelfish"
HOMEPAGE="http://www.hoetzel.info/Hacking/emacs/"
# taken from: http://www.hoetzel.info/Hacking/emacs/babel.el
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.el.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

SITEFILE=50${PN}-gentoo.el

src_unpack() {
	elisp_src_unpack
	epatch "${FILESDIR}/${P}-junk.patch"
}
