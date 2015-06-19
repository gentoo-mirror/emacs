# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-xemacs/easypg/easypg-1.03-r1.ebuild,v 1.7 2011/07/22 11:24:58 xarthisius Exp $

EAPI=5

SLOT="0"
IUSE=""
DESCRIPTION="GnuPG interface for Emacs."
PKG_CAT="standard"

KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~sparc ~x86"

EXPERIMENTAL=true

RDEPEND="app-xemacs/xemacs-base
app-xemacs/dired
app-xemacs/mail-lib
"

inherit xemacs-packages
