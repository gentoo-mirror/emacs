# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
NEED_EMACS=23

inherit elisp bzr

EBZR_REPO_URI="bzr://rudel.bzr.sourceforge.net/bzrroot/rudel/trunk"
DESCRIPTION="Collaborative editing environment for GNU Emacs"
HOMEPAGE="http://rudel.sourceforge.net/
	http://www.emacswiki.org/emacs/Rudel"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="virtual/emacs-cedet"
RDEPEND="${DEPEND}"

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

	elisp-site-file-install "${FILESDIR}/${SITEFILE}" || die

	insinto "${SITEETC}/${PN}"
	doins -r icons

	dodoc README INSTALL ChangeLog doc/card.pdf
}

pkg_postinst() {
	elisp_pkg_postinst

	elog "Connections to Gobby servers require the gnutls-cli program"
	elog "(net-libs/gnutls)."
	elog "The Avahi daemon (net-dns/avahi) is required for automatic"
	elog "session discovery and advertising."
}
