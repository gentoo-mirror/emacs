# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp readme.gentoo-r1

DESCRIPTION="An improved JavaScript mode for GNU Emacs"
HOMEPAGE="https://github.com/mooz/js2-mode/"
SRC_URI="https://github.com/mooz/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"

SITEFILE="50${PN}-gentoo.el"
DOCS="README.md NEWS.md"
DOC_CONTENTS="If you want to activate js2-mode automatically for .js files,
	add the following command to your ~/.emacs file:
	\n(add-to-list 'auto-mode-alist '(\""'\\\\.js\\\\'"'\" . js2-mode))"
