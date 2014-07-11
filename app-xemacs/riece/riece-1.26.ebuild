# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-xemacs/riece/riece-1.23.ebuild,v 1.8 2008/04/28 18:04:49 armin76 Exp $

EAPI=5

SLOT="0"
IUSE=""
DESCRIPTION="IRC client for Emacs."
PKG_CAT="standard"

EXPERIMENTAL=true

RDEPEND="app-xemacs/xemacs-base
app-xemacs/mail-lib
app-xemacs/bbdb
"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~sparc ~x86"

inherit xemacs-packages