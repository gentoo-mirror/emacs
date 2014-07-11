# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-xemacs/cedet-common/cedet-common-1.01.ebuild,v 1.10 2011/07/22 11:25:04 xarthisius Exp $

EAPI=5

SLOT="0"
IUSE=""
DESCRIPTION="Common files for CEDET development environment."
PKG_CAT="standard"

EXPERIMENTAL=true

RDEPEND="app-xemacs/xemacs-base
app-xemacs/edebug
"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~sparc ~x86"

inherit xemacs-packages