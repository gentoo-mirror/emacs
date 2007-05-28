# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/eclass/elisp.eclass,v 1.18 2007/04/16 15:41:02 opfer Exp $
#
# Copyright 2007 Hans de Graaff <graaff@gentoo.org>
#
# Based on elisp-common.eclass:
# Copyright 2007 Christian Faulhammer <opfer@gentoo.org>
# Copyright 2002-2007 Matthew Kennedy <mkennedy@gentoo.org>
# Copyright 2003 Jeremy Maitin-Shepard <jbms@attbi.com>
#
# Emacs support for other than pure elisp packages is handled by
# xemacs-elisp-common.eclass where you won't have a dependency on XEmacs
# itself.  All elisp-* functions are documented there.

inherit xemacs-elisp-common

DEPEND="app-editors/xemacs"
IUSE=""

xemacs-elisp_src_compile() {
	xemacs-elisp-compile *.el || die
}

xemacs-elisp_src_install () {
	xemacs-elisp-install "${PN}" *.el *.elc
}

EXPORT_FUNCTIONS src_compile src_install
