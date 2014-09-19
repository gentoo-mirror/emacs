# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-xemacs/calendar/calendar-1.38.ebuild,v 1.6 2011/07/22 11:25:05 xarthisius Exp $

EAPI=5

SLOT="0"
IUSE=""
DESCRIPTION="Calendar and diary support."
PKG_CAT="standard"

EXPERIMENTAL=true

RDEPEND="app-xemacs/xemacs-base
app-xemacs/fsf-compat
"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~sparc ~x86"

inherit xemacs-packages
