# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp readme.gentoo-r1

DESCRIPTION="Extensions to diff-mode.el"
HOMEPAGE="https://www.emacswiki.org/emacs/diff-mode-.el"
SRC_URI="https://dev.gentoo.org/~ulm/distfiles/${P}.el.xz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

SITEFILE="50${PN}-gentoo.el"
DOC_CONTENTS="This library should be loaded *before* library diff-mode.el.
	\nPut this in your initialization file, ~/.emacs:
	\n(require 'diff-mode-)"
