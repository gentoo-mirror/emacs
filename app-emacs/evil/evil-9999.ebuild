# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://github.com/emacs-evil/evil.git"
EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"

inherit elisp git-r3

DESCRIPTION="Extensible vi layer for Emacs"
HOMEPAGE="https://github.com/emacs-evil/evil"
S="${WORKDIR}/${PN}"

LICENSE="GPL-3+ FDL-1.3+"
SLOT="0"
RESTRICT="test"

RDEPEND=">=app-emacs/undo-tree-0.6.3"
BDEPEND="${RDEPEND}
	sys-apps/texinfo"

ELISP_REMOVE="evil-pkg.el evil-tests.el evil-test-helpers.el"
ELISP_TEXINFO="doc/build/texinfo/evil.texi"
SITEFILE="50${PN}-gentoo.el"
DOCS="CHANGES.org CONTRIBUTING.md README.md"
