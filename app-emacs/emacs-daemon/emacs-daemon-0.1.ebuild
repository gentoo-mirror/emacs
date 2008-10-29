# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Support files for Emacs daemon started as rc service"
HOMEPAGE="http://www.gentoo.org/proj/en/lisp/emacs/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=virtual/emacs-23"
RDEPEND="${DEPEND}
	>=sys-apps/openrc-0.3.0-r1"

EMACS="/usr/bin/emacs"

pkg_setup() {
	local has_daemon=$(${EMACS} -batch -q --no-site-file \
		--eval "(princ (fboundp 'daemonp))")
	if [ "${has_daemon}" != t ]; then
		ewarn "The current Emacs version does not support running as a daemon"
		ewarn "which is required for ${CATEGORY}/${P}."
		ewarn "Use \"eselect emacs\" to select an Emacs version >= 23."
	fi
}

src_install() {
	newinitd "${FILESDIR}/emacs-daemon.rc" emacs-daemon || die
	newconfd "${FILESDIR}/emacs-daemon.conf" emacs-daemon || die
}
