# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

SLOT="0"
IUSE=""
DESCRIPTION="C, C++ and Java language support."
PKG_CAT="standard"

EXPERIMENTAL=true

RDEPEND="app-xemacs/xemacs-base
app-xemacs/mail-lib
"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~sparc ~x86"

inherit xemacs-packages