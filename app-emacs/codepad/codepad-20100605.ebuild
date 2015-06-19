# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit elisp

DESCRIPTION="Interface to the codepad.org paste service"
HOMEPAGE="http://codepad.org/"
# taken from: https://github.com/ruediger/emacs-codepad.git
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.el.xz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-arch/xz-utils"

SITEFILE="50${PN}-gentoo.el"
