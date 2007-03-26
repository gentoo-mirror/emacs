# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="An Emacs mode for editing Portage .ebuild, .eclass and .eselect files."
HOMEPAGE="http://www.gentoo.org/"
#SRC_URI="mirror://gentoo/${P}.tar.bz2"
SRC_URI="http://wwwa1.kph.uni-mainz.de/users/ulm/gentoo/${P}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE=""

SITEFILE=50ebuild-mode-gentoo.el
