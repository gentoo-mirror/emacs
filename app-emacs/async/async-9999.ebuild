# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://github.com/jwiegley/emacs-async.git"
EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"

inherit elisp git-r3

DESCRIPTION="A simple asynchronous framework for Emacs"
HOMEPAGE="https://github.com/jwiegley/emacs-async"
S="${WORKDIR}/${PN}"

LICENSE="GPL-2+"
SLOT="0"

SITEFILE="50${PN}-gentoo.el"
DOCS="README.md"
