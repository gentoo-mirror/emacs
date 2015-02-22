# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="git://git.overlays.gentoo.org/proj/emacs-tools.git"
EGIT_BRANCH="${PN}"
EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"

inherit elisp-common eutils fdo-mime gnome2-utils readme.gentoo user git-r3

DESCRIPTION="Common files needed by all GNU Emacs versions"
HOMEPAGE="http://wiki.gentoo.org/wiki/Project:Emacs"

LICENSE="GPL-3+"
SLOT="0"
IUSE="games X"

PDEPEND="virtual/emacs"

S="${WORKDIR}/${PN}"

pkg_setup() {
	use games && enewgroup gamestat 36
}

src_install() {
	insinto "${SITELISP}"
	doins subdirs.el
	newins site-gentoo.el{,.orig}

	keepdir /etc/emacs
	insinto /etc/emacs
	doins site-start.el

	if use games; then
		keepdir /var/games/emacs
		fowners 0:gamestat /var/games/emacs
		fperms g+w /var/games/emacs
	fi

	if use X; then
		local i
		domenu emacs.desktop emacsclient.desktop || die

		pushd icons || die
		newicon sink.png emacs-sink.png
		newicon emacs_48.png emacs.png
		newicon emacs22_48.png emacs22.png
		for i in 16 24 32 48 128; do
			newicon -s ${i} emacs_${i}.png emacs.png
		done
		for i in 16 24 32 48; do
			newicon -s ${i} emacs22_${i}.png emacs22.png
		done
		doicon -s scalable emacs.svg
		popd

		gnome2_icon_savelist
	fi

	DOC_CONTENTS="All site initialisation for Gentoo-installed packages is
		added to ${SITELISP}/site-gentoo.el. In order for this site
		initialisation to be loaded for all users automatically, a default
		site startup file /etc/emacs/site-start.el is installed. You are
		responsible for maintenance of this file.
		\n\nAlternatively, individual users can add the following command:
		\n\n(require 'site-gentoo)
		\n\nto their ~/.emacs initialisation files, or, for greater
		flexibility, users may load single package-specific initialisation
		files from the ${SITELISP}/site-gentoo.d/ directory."
	readme.gentoo_create_doc
}

pkg_preinst() {
	# make sure that site-gentoo.el exists since site-start.el requires it
	if [[ ! -d ${EROOT}${SITELISP} ]]; then
		mv "${ED}${SITELISP}"/site-gentoo.el{.orig,} || die
	else
		elisp-site-regen
		rm "${ED}${SITELISP}/site-gentoo.el.orig" || die
		cp "${EROOT}${SITELISP}/site-gentoo.el" "${ED}${SITELISP}/" || die
	fi

	if use games; then
		local f
		for f in /var/games/emacs/{snake,tetris}-scores; do
			if [[ -e ${EROOT}${f} ]]; then
				cp "${EROOT}${f}" "${ED}${f}" || die
			fi
			touch "${ED}${f}" || die
			chgrp gamestat "${ED}${f}" || die
			chmod g+w "${ED}${f}" || die
		done
	fi
}

pkg_postinst() {
	if use X; then
		fdo-mime_desktop_database_update
		gnome2_icon_cache_update
	fi
	readme.gentoo_print_elog
}

pkg_postrm() {
	if use X; then
		fdo-mime_desktop_database_update
		gnome2_icon_cache_update
	fi
}
