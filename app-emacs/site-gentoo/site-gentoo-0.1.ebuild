# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp-common

DESCRIPTION="Gentoo site initialisation for Emacs"
HOMEPAGE="http://www.gentoo.org/proj/en/lisp/emacs/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

pkg_setup() {
	if [ -e "${ROOT}${SITELISP}/site-gentoo.el" ] \
		&& ! has_version ${CATEGORY}/${PN}; then
		einfo "Removing orphan site-gentoo.el, it will be regenerated later."
		rm -f "${ROOT}${SITELISP}/site-gentoo.el"
	fi
}

src_install() {
	dodir "${SITELISP}"
	touch "${D}${SITELISP}/site-gentoo.el"
}

pkg_postinst() {
	elisp-site-regen
}
