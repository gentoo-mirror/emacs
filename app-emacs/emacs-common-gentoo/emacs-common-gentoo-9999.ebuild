# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit elisp-common eutils fdo-mime gnome2-utils subversion

DESCRIPTION="Common files needed by all GNU Emacs versions"
HOMEPAGE="http://www.gentoo.org/proj/en/lisp/emacs/"
#SRC_URI="mirror://gentoo/${P}.tar.gz"
ESVN_REPO_URI="svn://anonsvn.gentoo.org/emacs/${PN}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~sparc-fbsd ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris ~x86-solaris"
IUSE="X emacs22icons"

PDEPEND="virtual/emacs"

S="${WORKDIR}/${PN}"

pkg_setup() {
	if [ -e "${EROOT}${SITELISP}/subdirs.el" ] \
		&& ! has_version ">=${CATEGORY}/${PN}-1"
	then
		ewarn "Removing orphan subdirs.el (installed by old Emacs ebuilds)"
		rm -f "${EROOT}${SITELISP}/subdirs.el"
	fi
}

src_install() {
	keepdir "${SITELISP}"
	elisp-install . subdirs.el || die

	keepdir /etc/emacs
	insinto /etc/emacs
	doins site-start.el

	if use X; then
		local i
		domenu emacs.desktop emacsclient.desktop || die
		newicon icons/sink.png emacs-sink.png || die
		if use emacs22icons; then
			newicon icons/emacs22_48.png emacs.png || die
			for i in 16 24 32 48; do
				insinto /usr/share/icons/hicolor/${i}x${i}/apps
				newins icons/emacs22_${i}.png emacs.png
			done
		else
			newicon icons/emacs_48.png emacs.png || die
			for i in 16 24 32 48 128; do
				insinto /usr/share/icons/hicolor/${i}x${i}/apps
				newins icons/emacs_${i}.png emacs.png
			done
			insinto /usr/share/icons/hicolor/scalable/apps
			doins icons/emacs.svg
		fi
		gnome2_icon_savelist
	fi
}

pkg_postinst() {
	if use X; then
		fdo-mime_desktop_database_update
		gnome2_icon_cache_update
	fi

	# make sure that site-gentoo.el exists since site-start.el requires it
	elisp-site-regen

	local line
	while read line; do elog "${line:- }"; done <<-EOF
	All site initialisation for Gentoo-installed packages is added to
	${SITELISP}/site-gentoo.el. In order for this site
	initialisation to be loaded for all users automatically, a default
	site startup file /etc/emacs/site-start.el is installed. You are
	responsible for maintenance of this file.

	Alternatively, individual users can add the following command:

	(require 'site-gentoo)

	to their ~/.emacs initialisation files, or, for greater flexibility,
	users may load single package-specific initialisation files from
	${SITELISP}/site-gentoo.d/.
	EOF

	if [[ -e ${EROOT}${SITELISP}/site-start.el ]]; then
		elog
		while read line; do ewarn "${line}"; done <<-EOF
		The location of the site startup file for Emacs has changed to
		/etc/emacs/site-start.el. If your site-start file contains your own
		customisation, then you should move it to the new file. In any case,
		you should remove the old ${SITELISP}/site-start.el file.
		EOF
	fi
}

pkg_postrm() {
	if use X; then
		fdo-mime_desktop_database_update
		gnome2_icon_cache_update
	fi
}
