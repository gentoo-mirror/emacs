# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit readme.gentoo elisp bzr

EBZR_REPO_URI="bzr://rudel.bzr.sourceforge.net/bzrroot/rudel/trunk"
DESCRIPTION="Collaborative editing environment for GNU Emacs"
HOMEPAGE="http://rudel.sourceforge.net/
	http://www.emacswiki.org/emacs/Rudel"

LICENSE="GPL-3+"
SLOT="0"

SITEFILE="60${PN}-gentoo.el"

src_compile() {
	${EMACS} ${EMACSFLAGS} -l rudel-compile.el || die
}

src_install() {
	local dir

	for dir in . adopted infinote jupiter obby socket telepathy tls \
		xmpp zeroconf
	do
		insinto "${SITELISP}/${PN}/${dir}"
		doins ${dir}/*.{el,elc}
	done

	elisp-site-file-install "${FILESDIR}/${SITEFILE}"

	insinto "${SITEETC}/${PN}"
	doins -r icons

	dodoc README INSTALL ChangeLog TODO doc/card.pdf

	DOC_CONTENTS="Connections to Gobby servers require the gnutls-cli program
		(net-libs/gnutls).
		\\n\\nThe Avahi daemon (net-dns/avahi) is required for automatic
		session discovery and advertising."
	readme.gentoo_create_doc
}
