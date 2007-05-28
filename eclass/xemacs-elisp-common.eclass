# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/eclass/elisp-common.eclass,v 1.20 2007/04/29 12:59:39 ulm Exp $
#
# Copyright 2007 Hans de Graaff <graaff@gentoo.org>
#
# Based on elisp-common.eclass:
# Copyright 2007 Christian Faulhammer <opfer@gentoo.org>
# Copyright 2002-2007 Matthew Kennedy <mkennedy@gentoo.org>
# Copyright 2003 Jeremy Maitin-Shepard <jbms@attbi.com>
# Copyright 2007 Ulrich Mueller <ulm@gentoo.org>
#
# This eclass aids in the compilation and installation of XEmacs elisp
# files. It is not a true eclass but rather aids in compiling and
# installing elisp code for XEmacs. If you need to install a
# standalone XEmacs elisp package you should be using
# xemacs-elisp.eclass instead.


SITEPACKAGE=/usr/lib/xemacs/site-packages
XEMACS=/usr/bin/xemacs
XEMACS_BATCH_CLEAN="${XEMACS} --batch --no-site-file --no-init-file"

# Compile elisp files with xemacs
xemacs-elisp-compile () {
	${XEMACS_BATCH_CLEAN} -f batch-byte-compile $*
	xemacs-elisp-make-autoloads-file $*
}

xemacs-elisp-make-autoloads-file () {
	${XEMACS_BATCH_CLEAN} \
		-eval "(setq autoload-package-name \"${PN}\")" \
		-eval "(setq generated-autoload-file \"${S}/auto-autoloads.el\")" \
		-l autoload -f batch-update-autoloads $@
		

}

# Install elisp source and byte-comiled files. All files are installed
# in site-packages in their own directory, indicated by the first
# argument to the function.
xemacs-elisp-install () {
	local subdir="$1"
	dodir "${SITEPACKAGE}"/lisp/"${subdir}"
	insinto "${SITEPACKAGE}"/lisp/"${subdir}"
	shift
	doins $@
}
