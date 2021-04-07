# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://anongit.gentoo.org/git/proj/ebuild-mode.git"
EGIT_BRANCH="master"
EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"

inherit git-r3

DESCRIPTION="Emacs modes for editing ebuilds and other Gentoo specific files"
HOMEPAGE="https://wiki.gentoo.org/wiki/Project:Emacs"

LICENSE="GPL-2+"
SLOT="0"

RDEPEND=">=app-editors/xemacs-21.4.20-r5
	app-xemacs/sh-script"
BDEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}"

src_compile() {
	local XEMACS="${EPREFIX}/usr/bin/xemacs"

	"${XEMACS}" -batch -q --no-site-file \
		-eval "(add-to-list 'load-path \".\")" \
		-f batch-byte-compile \
		ebuild-mode.el gentoo-newsitem-mode.el || die

	"${XEMACS}" -batch -q --no-site-file \
		-eval "(setq autoload-package-name \"${PN}\")" \
		-eval "(setq generated-autoload-file \"${S}/auto-autoloads.el\")" \
		-l autoload -f batch-update-autoloads \
		ebuild-mode.el gentoo-newsitem-mode.el || die
}

src_install() {
	insinto /usr/share/xemacs/site-packages/lisp/${PN}
	doins *.el *.elc
}
