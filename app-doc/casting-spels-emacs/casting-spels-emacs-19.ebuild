# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="Casting SPELs in Lisp - A Comic Book (Emacs Lisp Edition)"
HOMEPAGE="http://code.google.com/p/casting-spels-emacs/"
SRC_URI="http://casting-spels-emacs.googlecode.com/files/${PN}-v${PV}.zip"

LICENSE="GPL-2 FDL-1.2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

S="${WORKDIR}/${PN}"

src_compile() { :; }

src_install() {
	elisp-install ${PN} lisp/*.el || die "elisp-install failed"
	elisp-site-file-install "${FILESDIR}/${SITEFILE}" \
		|| die "elisp-site-file-install failed"
	dohtml -r html/. images || die "dohtml failed"
	dosym html/images /usr/share/doc/${PF}/images
	dodoc README.txt test/walk-through-commands.el
}
