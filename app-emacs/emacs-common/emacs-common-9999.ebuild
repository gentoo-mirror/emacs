# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_REPO_URI="https://anongit.gentoo.org/git/proj/emacs-tools.git"
EGIT_BRANCH="${PN}"
EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"

inherit elisp-common desktop eapi9-pipestatus gnome2-utils xdg-utils readme.gentoo-r1 git-r3

DESCRIPTION="Common files needed by all GNU Emacs versions"
HOMEPAGE="https://wiki.gentoo.org/wiki/Project:Emacs"
S="${WORKDIR}/${PN}"

LICENSE="GPL-3+"
SLOT="0"
IUSE="games gsettings gui"

DEPEND="games? ( acct-group/gamestat )"
RDEPEND="${DEPEND}"
PDEPEND=">=app-editors/emacs-23.1:*"
IDEPEND="gui? ( gsettings? ( dev-libs/glib ) )"

src_install() {
	insinto "${SITELISP}"
	sed -e "s:@libdir@:$(get_libdir):g" subdirs.el.in | newins - subdirs.el
	pipestatus || die
	newins site-gentoo.el{,.orig}

	keepdir /etc/emacs
	insinto /etc/emacs
	doins site-start.el

	exeinto /etc/user/init.d
	sed -e "s,/usr/bin/emacs,${EPREFIX}&," emacs.initd | newexe - emacs
	pipestatus || die

	if use games; then
		keepdir /var/games/emacs
		fowners 0:gamestat /var/games/emacs
		fperms g+w /var/games/emacs
	fi

	if use gui; then
		local i
		domenu emacs.desktop emacsclient.desktop

		pushd icons || die
		newicon sink.png emacs-sink.png
		newicon emacs25_48.png emacs.png
		for i in 16 24 32 48 128; do
			[[ ${i} -le 48 ]] && newicon -s ${i} emacs22_${i}.png emacs22.png
			newicon -s ${i} emacs23_${i}.png emacs23.png
			newicon -s ${i} emacs25_${i}.png emacs.png
		done
		doicon -s scalable emacs23.svg
		newicon -s scalable emacs25.svg emacs.svg
		popd

		if use gsettings; then
			insinto /usr/share/glib-2.0/schemas
			doins org.gnu.emacs.defaults.gschema.xml
		fi
	fi

	DOC_CONTENTS="All site initialisation for Gentoo-installed packages is
		added to ${SITELISP}/site-gentoo.el. In order for this site
		initialisation to be loaded for all users automatically, a default
		site startup file /etc/emacs/site-start.el is installed. You are
		responsible for maintenance of this file.
		\n\nAlternatively, individual users can add the following command:
		\n\n\t(require 'site-gentoo)
		\n\nto their ~/.emacs initialisation files, or, for greater
		flexibility, users may load single package-specific initialisation
		files from the ${SITELISP}/site-gentoo.d/ directory."

	[[ -d /run/openrc ]] && DOC_CONTENTS+="\n\n\nTo have OpenRC
		(version 0.60 or later) automatically start Emacs as a daemon in
		your user session, login as normal user and execute the command:
		\n\n\t$ rc-update --user add emacs default
		\n\nThis will add emacs to the default runlevel in
		~/.config/rc/runlevels/.
		\n\nIf you want to start your user's Emacs daemon at system startup
		and have it persist between login sessions, do the following in
		addition (as the superuser):
		\n\n\t# ln -s user /etc/init.d/user.<user>
		\n\t# rc-service user.<user> start
		\n\t# rc-update add user.<user> default
		\n\nSee OpenRC's user guide for the full documentation."

	readme.gentoo_create_doc
}

pkg_preinst() {
	# make sure that site-gentoo.el exists since site-start.el requires it
	if [[ ! -f ${ED}${SITELISP}/site-gentoo.el ]]; then		#554518
		mv "${ED}${SITELISP}"/site-gentoo.el{.orig,} || die
	fi
	if [[ -d ${EROOT}${SITELISP} ]]; then
		elisp-site-regen
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
	if use gui; then
		xdg_desktop_database_update
		xdg_icon_cache_update
		use gsettings && gnome2_schemas_update
	fi
	readme.gentoo_print_elog
}

pkg_postrm() {
	if use gui; then
		xdg_desktop_database_update
		xdg_icon_cache_update
		use gsettings && gnome2_schemas_update
	fi
}
