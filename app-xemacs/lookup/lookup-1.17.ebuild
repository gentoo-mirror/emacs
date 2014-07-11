# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-xemacs/lookup/lookup-1.15.ebuild,v 1.4 2007/07/11 02:37:38 mr_bones_ Exp $

EAPI=5

SLOT="0"
IUSE=""
DESCRIPTION="MULE: Dictionary support"
PKG_CAT="mule"

EXPERIMENTAL=true

RDEPEND="app-xemacs/mule-base
app-xemacs/cookie
"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~sparc ~x86"

inherit xemacs-packages
