# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit elisp

DESCRIPTION="A powerfull undo/redo system"
HOMEPAGE="http://www.dr-qubit.org/emacs.php"
SRC_URI="http://dev.gentoo.org/~fauli/${P}.el.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

SITEFILE=50${PN}-gentoo.el

DEPEND=""
RDEPEND="${DEPEND}"
