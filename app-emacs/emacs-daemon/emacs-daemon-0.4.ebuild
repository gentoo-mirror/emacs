# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="Gentoo support for Emacs running as a server in the background"
HOMEPAGE="http://www.gentoo.org/proj/en/lisp/emacs/"
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=virtual/emacs-23"
RDEPEND="${DEPEND}
	>=sys-apps/openrc-0.3.0-r1"

SITEFILE=10${PN}-gentoo.el

pkg_setup() {
	local has_daemon=$(${EMACS} ${EMACSFLAGS} \
		--eval "(princ (fboundp 'daemonp))")
	if [ "${has_daemon}" != t ]; then
		ewarn "Your current Emacs version does not support running as a daemon"
		ewarn "which is required for ${CATEGORY}/${PN}."
		ewarn "Use \"eselect emacs\" to select an Emacs version >= 23."
	fi
}

src_compile() { :; }

src_install() {
	newinitd emacs.rc emacs || die
	elisp-site-file-install "${SITEFILE}" || die
	keepdir /var/run/emacs || die
}
