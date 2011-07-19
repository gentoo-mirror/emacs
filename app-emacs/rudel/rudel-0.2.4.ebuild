# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
NEED_EMACS=22

inherit elisp versionator

MY_P=${PN}-$(replace_version_separator 2 "-")
DESCRIPTION="Collaborative editing environment for GNU Emacs"
HOMEPAGE="http://rudel.sourceforge.net/
	http://www.emacswiki.org/emacs/Rudel"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="virtual/emacs-cedet"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"
ELISP_PATCHES="${P}-icons-dir.patch
	${P}-require-cl.patch"
SITEFILE="60${PN}-gentoo.el"

src_compile() {
	${EMACS} ${EMACSFLAGS} -l rudel-compile.el || die
}

src_install() {
	local subdir

	elisp-install ${PN} *.{el,elc} || die
	for subdir in jupiter obby zeroconf; do
		elisp-install ${PN}/${subdir} ${subdir}/*.{el,elc} || die
	done
	elisp-site-file-install "${FILESDIR}/${SITEFILE}"

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
