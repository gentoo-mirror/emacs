# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-xemacs/ilisp/ilisp-1.36.ebuild,v 1.6 2011/07/22 11:25:08 xarthisius Exp $

EAPI=5

SLOT="0"
IUSE=""
DESCRIPTION="Front-end for Inferior Lisp."
PKG_CAT="standard"

EXPERIMENTAL=true

RDEPEND="app-xemacs/xemacs-base
app-xemacs/mail-lib
app-xemacs/fsf-compat
app-xemacs/xemacs-eterm
app-xemacs/sh-script
"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~sparc ~x86"

inherit xemacs-packages
