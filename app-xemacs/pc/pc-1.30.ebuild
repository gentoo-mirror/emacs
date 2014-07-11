# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-xemacs/pc/pc-1.28.ebuild,v 1.4 2007/07/11 02:37:37 mr_bones_ Exp $

EAPI=5

SLOT="0"
IUSE=""
DESCRIPTION="PC style interface emulation."
PKG_CAT="standard"

EXPERIMENTAL=true

RDEPEND="app-xemacs/xemacs-base
"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~sparc ~x86"

inherit xemacs-packages
