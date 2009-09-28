# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A simple Emacs Lisp tutorial"
HOMEPAGE="http://www.gnuvola.org/software/elisp-tutorial/"
SRC_URI="http://www.gnuvola.org/software/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_install() {
	dohtml index.html || die
	dodoc *.el ChangeLog NEWS || die
}

pkg_postinst() {
	elog "Open /usr/share/doc/${PF}/html/index.html with your browser."
	elog "The Lisp files of the tutorial can be found in /usr/share/doc/${PF}."
}
