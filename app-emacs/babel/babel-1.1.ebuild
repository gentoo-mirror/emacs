# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp

DESCRIPTION="Interface to web translation services such as Babelfish"
HOMEPAGE="https://www.hoetzel.info/Hacking/emacs/"
# taken from: http://www.hoetzel.info/Hacking/emacs/babel.el
SRC_URI="https://dev.gentoo.org/~ulm/distfiles/${P}.el.bz2"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

SITEFILE="50${PN}-gentoo.el"
