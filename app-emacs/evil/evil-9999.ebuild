# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
EGIT_REPO_URI="git://gitorious.org/evil/evil.git"

inherit elisp git-2

DESCRIPTION="Extensible vi layer"
HOMEPAGE="http://gitorious.org/evil"
SRC_URI=""

LICENSE="GPL-2 FDL-1.3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-emacs/undo-tree"
RDEPEND="${DEPEND}"

ELISP_REMOVE="evil-pkg.el evil-tests.el"
ELISP_TEXINFO="doc/evil.texi"
SITEFILE="50${PN}-gentoo.el"
