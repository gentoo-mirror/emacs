# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Test suite harness for testing XEmacs"
HOMEPAGE="https://www.xemacs.org/"
SRC_URI="http://ftp.xemacs.org/pub/xemacs/xemacs-$(ver_cut 1-2)/xemacs-${PV}.tar.gz"
S="${WORKDIR}/xemacs-${PV}/tests/automated"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=">=app-editors/xemacs-${PV}"
BDEPEND="${RDEPEND}"

src_compile() {
	local EMACS="${EPREFIX}/usr/bin/xemacs"

	"${EMACS}" -batch -q --no-site-file \
		-eval "(add-to-list 'load-path nil)" \
		-f batch-byte-compile test-harness.el || die
}

src_test() { :; }

src_install() {
	insinto /usr/lib/xemacs/site-packages/lisp/${PN}
	doins test-harness.{el,elc}
}
