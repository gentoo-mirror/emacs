# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp eutils

DESCRIPTION="Complaint generator for GNU Emacs"
HOMEPAGE="http://groups.google.com/group/comp.emacs/msg/00352d73fff71dca"
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.el.bz2
	http://dev.gentoo.org/~ulm/distfiles/${P}-patches.tar.bz2"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

SIMPLE_ELISP=t
SITEFILE=50${PN}-gentoo.el

src_unpack() {
	elisp_src_unpack
	EPATCH_SUFFIX=patch epatch
}
