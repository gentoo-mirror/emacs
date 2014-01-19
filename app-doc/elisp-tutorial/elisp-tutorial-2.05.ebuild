# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit readme.gentoo

DESCRIPTION="A simple Emacs Lisp tutorial"
HOMEPAGE="http://www.gnuvola.org/software/elisp-tutorial/"
SRC_URI="http://www.gnuvola.org/software/${PN}/${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_install() {
	dohtml index.html
	dodoc *.el ChangeLog NEWS

	DOC_CONTENTS="Open /usr/share/doc/${PF}/html/index.html with your browser.
		The Lisp files of the tutorial can be found in /usr/share/doc/${PF}/."
	readme.gentoo_create_doc
}
