# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
EGIT_REPO_URI="https://github.com/jwiegley/emacs-async.git"

inherit elisp git-2

DESCRIPTION="A simple asynchronous framework for Emacs"
HOMEPAGE="https://github.com/jwiegley/emacs-async"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

SITEFILE="50${PN}-gentoo.el"
DOCS="README.md"
