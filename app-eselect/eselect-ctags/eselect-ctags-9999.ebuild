# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MY_PN="eselect-emacs"
EGIT_REPO_URI="https://anongit.gentoo.org/git/proj/emacs-tools.git"
EGIT_BRANCH="${MY_PN}"
EGIT_CHECKOUT_DIR="${WORKDIR}/${MY_PN}"

inherit git-r3

DESCRIPTION="Manages ctags implementations"
HOMEPAGE="https://wiki.gentoo.org/wiki/Project:Emacs"

LICENSE="GPL-2+"
SLOT="0"

RDEPEND="!<app-eselect/eselect-emacs-1.18
	>=app-admin/eselect-1.2.3"

S="${WORKDIR}/${MY_PN}"

src_install() {
	insinto /usr/share/eselect/modules
	doins {ctags,etags}.eselect
	doman {ctags,etags}.eselect.5
}
