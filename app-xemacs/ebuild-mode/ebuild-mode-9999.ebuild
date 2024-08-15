# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit optfeature

EGIT_REPO_URI="https://anongit.gentoo.org/git/proj/ebuild-mode.git"
EGIT_BRANCH="master"
EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"

inherit git-r3

DESCRIPTION="Emacs modes for editing ebuilds and other Gentoo specific files"
HOMEPAGE="https://wiki.gentoo.org/wiki/Project:Emacs"
S="${WORKDIR}/${PN}"

LICENSE="GPL-2+"
SLOT="0"

RDEPEND=">=app-editors/xemacs-21.4.20-r5
	app-xemacs/sh-script"
BDEPEND="${RDEPEND}"

src_compile() {
	local XEMACS="${EPREFIX}/usr/bin/xemacs"

	"${XEMACS}" -batch -q --no-site-file \
		-eval "(add-to-list 'load-path nil)" \
		-f batch-byte-compile \
		ebuild-mode.el gentoo-newsitem-mode.el || die

	"${XEMACS}" -batch -q --no-site-file \
		-eval "(setq autoload-package-name \"${PN}\")" \
		-eval "(setq generated-autoload-file \"${S}/auto-autoloads.el\")" \
		-l autoload -f batch-update-autoloads \
		ebuild-mode.el gentoo-newsitem-mode.el || die
}

src_test() { :; }  # ERT is not yet available for XEmacs

src_install() {
	insinto /usr/share/xemacs/site-packages/lisp/${PN}
	doins *.el *.elc
}

pkg_postinst() {
	optfeature "ebuild commands support" sys-apps/portage
	optfeature "additional development tools" dev-util/pkgdev
	optfeature "ebuild QA utilities" dev-util/pkgcheck
}
