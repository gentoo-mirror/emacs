# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit readme.gentoo-r1

DESCRIPTION="A simple Emacs Lisp tutorial"
HOMEPAGE="https://www.gnuvola.org/software/elisp-tutorial/"
# taken from: https://www.gnuvola.org/software/${PN}/${P}.tar.gz"
SRC_URI="https://dev.gentoo.org/~ulm/distfiles/${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_install() {
	docinto html
	dodoc index.html
	docinto .
	dodoc *.el ChangeLog NEWS

	DOC_CONTENTS="Open /usr/share/doc/${PF}/html/index.html with your browser.
		The Lisp files of the tutorial can be found in /usr/share/doc/${PF}/."
	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
}
