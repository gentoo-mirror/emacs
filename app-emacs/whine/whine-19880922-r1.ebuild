# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp eutils

DESCRIPTION="Complaint generator for GNU Emacs"
HOMEPAGE="http://groups.google.de/group/comp.emacs/msg/00352d73fff71dca"
SRC_URI="http://wwwa1.kph.uni-mainz.de/users/ulm/distfiles/${P}.el.bz2"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

SIMPLE_ELISP=t
SITEFILE=50${PN}-gentoo.el

src_unpack() {
	elisp_src_unpack
	epatch "${FILESDIR}/${PN}-repair-keysequences.patch"
	epatch "${FILESDIR}/${PN}-gentoo.patch"
	epatch "${FILESDIR}/${PN}-new-style-backquotes-gentoo.patch"
}
