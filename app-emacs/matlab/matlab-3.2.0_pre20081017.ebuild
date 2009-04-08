# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="Major modes for MATLAB dot-m and dot-tlc files"
HOMEPAGE="http://matlab-emacs.sourceforge.net/"
SRC_URI="http://dev.gentoo.org/~fauli/distfiles/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

DEPEND="app-emacs/cedet"
RDEPEND="${DEPEND}"

SITEFILE=51${PN}-gentoo.el
DOCS="README INSTALL ChangeLog*"
