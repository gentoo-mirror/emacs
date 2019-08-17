# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp

DESCRIPTION="A smart M-x enhancement for Emacs"
HOMEPAGE="https://www.emacswiki.org/emacs/Smex
	https://github.com/nonsequitur/smex"
SRC_URI="https://github.com/nonsequitur/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

SITEFILE="50${PN}-gentoo.el"
DOCS="README.markdown"
