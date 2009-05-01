# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="A major mode for GNU Emacs for editing YAML files"
HOMEPAGE="http://svn.clouder.jp/repos/public/yaml-mode/trunk/"
SRC_URI="http://www.flameeyes.eu/gentoo-distfiles/${P}.tar.bz2
	http://dev.gentoo.org/~ulm/distfiles/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS="README Changes"
SITEFILE="50${PN}-gentoo.el"
