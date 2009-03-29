# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp-common eutils fdo-mime gnome2-utils

DESCRIPTION="Common files needed by all GNU Emacs versions"
HOMEPAGE="http://www.gentoo.org/proj/en/lisp/emacs/"
SRC_URI="mirror://gentoo/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE="X"

PDEPEND="virtual/emacs"

pkg_setup() {
	if [ -e "${ROOT}${SITELISP}/subdirs.el" ] \
		&& ! has_version ">=${CATEGORY}/${PN}-1"
	then
		ewarn "Removing orphan subdirs.el (installed by old Emacs ebuilds)"
		rm -f "${ROOT}${SITELISP}/subdirs.el"
	fi
}

src_install() {
	elisp-install . subdirs.el "${FILESDIR}/site-start.el" || die

	echo "CONFIG_PROTECT=\"${SITELISP}/site-start.el\"" >"${T}/50${PN}" || die
	doenvd "${T}/50${PN}" || die

	if use X; then
		local i
		domenu emacs.desktop emacsclient.desktop || die
		newicon emacs_48.png emacs.png || die
		for i in 16 24 32 48; do
			insinto /usr/share/icons/hicolor/${i}x${i}/apps
			newins emacs_${i}.png emacs.png || die
		done
	fi
}

pkg_postinst() {
	local line

	if use X; then
		fdo-mime_desktop_database_update
		gnome2_icon_cache_update
	fi

	# make sure that site-gentoo.el exists since site-start.el requires it
	elisp-site-regen

	echo
	while read line; do elog "${line:- }"; done <<-EOF
	All site initialisation for Gentoo-installed packages is added to
	/usr/share/emacs/site-lisp/site-gentoo.el. In order for this site
	initialisation to be loaded for all users automatically, a default
	site-start.el is created in the same directory. You are responsible
	for all further maintenance of this file.

	Alternatively, individual users can add the following command:

	(require 'site-gentoo)

	to their ~/.emacs initialisation files, or, for greater flexibility,
	users may load single package-specific initialisation files from
	/usr/share/emacs/site-lisp/site-gentoo.d/.
	EOF
	echo
}

pkg_postrm() {
	if use X; then
		fdo-mime_desktop_database_update
		gnome2_icon_cache_update
	fi
}
