# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGIT_REPO_URI="git://anongit.gentoo.org/proj/ebuild-mode.git"
EGIT_BRANCH="master"
EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"

inherit readme.gentoo-r1 elisp git-r3

DESCRIPTION="Emacs modes for editing ebuilds and other Gentoo specific files"
HOMEPAGE="https://wiki.gentoo.org/wiki/Project:Emacs"

LICENSE="GPL-2+"
SLOT="0"

S="${WORKDIR}/${PN}"
DOCS="ChangeLog keyword-generation.sh"
ELISP_TEXINFO="${PN}.texi"
SITEFILE="50${PN}-gentoo.el"
DOC_CONTENTS="Some optional features may require installation of additional
	packages, like app-portage/gentoolkit-dev for echangelog."
