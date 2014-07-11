# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-xemacs/mine/mine-1.16.ebuild,v 1.4 2007/07/11 02:37:38 mr_bones_ Exp $

EAPI=5

SLOT="0"
IUSE=""
DESCRIPTION="Minehunt Game."
PKG_CAT="standard"

EXPERIMENTAL=true

RDEPEND="app-xemacs/xemacs-base
"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~sparc ~x86"

inherit xemacs-packages
