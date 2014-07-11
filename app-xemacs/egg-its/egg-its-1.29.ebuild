# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-xemacs/egg-its/egg-its-1.27.ebuild,v 1.3 2007/06/03 19:47:28 graaff Exp $

EAPI=5

SLOT="0"
IUSE=""
DESCRIPTION="MULE: Wnn (4.2 and 6) support.  SJ3 support."
PKG_CAT="mule"

EXPERIMENTAL=true

RDEPEND="app-xemacs/leim
app-xemacs/mule-base
app-xemacs/fsf-compat
app-xemacs/xemacs-base
"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~sparc ~x86"

inherit xemacs-packages
