# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/eclass/elisp.eclass,v 1.18 2007/04/16 15:41:02 opfer Exp $
#
# Copyright 2007 Christian Faulhammer <opfer@gentoo.org>
# Copyright 2002-2007 Matthew Kennedy <mkennedy@gentoo.org>
# Copyright 2003 Jeremy Maitin-Shepard <jbms@attbi.com>
#
# This eclass sets the site-lisp directory for emacs-related packages.
#
# Emacs support for other than pure elisp packages is handled by
# elisp-common.eclass where you won't have a dependency on Emacs
# itself.  All elisp-* functions are documented there.
#
# Setting SIMPLE_ELISP=t in an ebuild means, that the package's source
# is a single (in whatever way) compressed elisp file with the file name
# ${PN}-${PV}.  The consequences:
#
# 1.) ${S} is redefined
# 2.) ${PN}-${PV}.el is moved to ${PN} in the system.
#
# SRC_URI should be set to wherever the primary app-emacs/ maintainer
# keeps the local elisp mirror, since most app-emacs packages are
# upstream as a single .el file.
#
# If you need anything different from Emacs 21, use the NEED_EMACS variable
# before inheriting elisp.eclass.  Set it to the major version your package uses
# and the dependency will be adjusted. (still experimental, not working!)

inherit elisp-common versionator

## Experimental code for proper new style virtual dependencies:
VERSION=${NEED_EMACS:-21}
#
# DEPEND=">=virtual/emacs-${VERSION}"
#
elisp_pkg_setup() {
	# Is this first test necessary? The case of < 2 digits will be caught
	# by the version comparison anyway. - ulm
	if ! [ -z ${VERSION//[0-9][0-9]/} ]; then
		die "Please specify a proper Emacs version number.  It has to be two digits!"
	fi
	echo "Given Emacs version number: " ${VERSION} #for debugging
#	if ! version_is_at_least "${VERSION}" "$(elisp-emacs-version)"; then
#		die "You need at least Emacs ${VERSION} as your current active version.
#		Use \"eselect emacs\" to select the version."
#	fi
}

##

if [ "${SIMPLE_ELISP}" = 't' ]; then
	S="${WORKDIR}/"
fi

DEPEND="virtual/emacs"
IUSE=""

elisp_src_unpack() {
	unpack ${A}
	if [ "${SIMPLE_ELISP}" = 't' ]
		then
		cd "${S}" && mv ${P}.el ${PN}.el
	fi
}

elisp_src_compile() {
	elisp-compile *.el || die
}

elisp_src_install() {
	elisp-install ${PN} *.el *.elc
	elisp-site-file-install "${FILESDIR}/${SITEFILE}"
}

elisp_pkg_postinst() {
	elisp-site-regen
}

elisp_pkg_postrm() {
	elisp-site-regen
}

EXPORT_FUNCTIONS src_unpack src_compile src_install pkg_postinst pkg_postrm pkg_setup