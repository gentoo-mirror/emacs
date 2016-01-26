# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

EGIT_REPO_URI="git://gitorious.org/evil/evil.git"
EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"

inherit elisp git-r3

DESCRIPTION="Extensible vi layer"
HOMEPAGE="http://gitorious.org/evil"

LICENSE="GPL-3+ FDL-1.3+"
SLOT="0"

DEPEND="app-emacs/undo-tree"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"
ELISP_REMOVE="evil-pkg.el evil-tests.el"
ELISP_TEXINFO="doc/evil.texi"
SITEFILE="50${PN}-gentoo.el"
