# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_REPO_URI="https://anongit.gentoo.org/git/proj/ebuild-mode.git"
EGIT_BRANCH="master"
EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"

inherit elisp git-r3 optfeature

DESCRIPTION="Emacs modes for editing ebuilds and other Gentoo specific files"
HOMEPAGE="https://wiki.gentoo.org/wiki/Project:Emacs"
S="${WORKDIR}/${PN}"

LICENSE="GPL-2+"
SLOT="0"

BDEPEND="sys-apps/texinfo"

DOCS="ChangeLog keyword-generation.sh"
ELISP_TEXINFO="${PN}.texi"
SITEFILE="50${PN}-gentoo.el"

pkg_postinst() {
	elisp_pkg_postinst
	optfeature "ebuild commands support" sys-apps/portage
	optfeature "additional development tools" dev-util/pkgdev
	optfeature "ebuild QA utilities" dev-util/pkgcheck
	optfeature "XML syntax validation" app-emacs/nxml-gentoo-schemas
	optfeature "generating HTML from GLEPs" dev-python/docutils-glep
}
