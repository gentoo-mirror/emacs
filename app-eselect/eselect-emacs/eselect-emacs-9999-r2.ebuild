# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="git://git.overlays.gentoo.org/proj/emacs-tools.git"
EGIT_BRANCH="${PN}"
EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"

inherit git-r3

DESCRIPTION="Manage multiple Emacs versions on one system"
HOMEPAGE="http://wiki.gentoo.org/wiki/Project:Emacs"

LICENSE="GPL-2+"
SLOT="0"

RDEPEND=">=app-admin/eselect-1.2.6
	~app-eselect/eselect-ctags-${PV}"

S="${WORKDIR}/${PN}"

src_compile() { :; }

src_install() {
	insinto /usr/share/eselect/modules
	doins {emacs,gnuclient}.eselect
	doman {emacs,gnuclient}.eselect.5
	dodoc ChangeLog
}
