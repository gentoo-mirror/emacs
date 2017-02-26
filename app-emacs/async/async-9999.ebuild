# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

EGIT_REPO_URI="https://github.com/jwiegley/emacs-async.git"
EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"

inherit elisp git-r3

DESCRIPTION="A simple asynchronous framework for Emacs"
HOMEPAGE="https://github.com/jwiegley/emacs-async"

LICENSE="GPL-2+"
SLOT="0"

S="${WORKDIR}/${PN}"
SITEFILE="50${PN}-gentoo.el"
DOCS="README.md"
