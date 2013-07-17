# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-xemacs/prog-modes/prog-modes-2.20.ebuild,v 1.6 2011/07/22 11:25:01 xarthisius Exp $

EAPI=5

SLOT="0"
IUSE=""
DESCRIPTION="Support for various programming languages."
PKG_CAT="standard"

EXPERIMENTAL=true

RDEPEND="app-xemacs/mail-lib
app-xemacs/xemacs-devel
app-xemacs/xemacs-base
app-xemacs/cc-mode
app-xemacs/fsf-compat
app-xemacs/edit-utils
app-xemacs/ediff
app-xemacs/emerge
app-xemacs/efs
app-xemacs/vc
app-xemacs/speedbar
app-xemacs/dired
app-xemacs/ilisp
app-xemacs/sh-script
app-xemacs/cedet-common
app-xemacs/w3
app-xemacs/gnus
"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~sparc ~x86"

inherit xemacs-packages
