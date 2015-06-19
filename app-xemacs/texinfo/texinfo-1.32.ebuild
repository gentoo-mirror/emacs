# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-xemacs/texinfo/texinfo-1.30.ebuild,v 1.6 2007/10/15 06:21:53 jer Exp $

EAPI=5

SLOT="0"
IUSE=""
DESCRIPTION="XEmacs TeXinfo support."
PKG_CAT="standard"

EXPERIMENTAL=true

RDEPEND="app-xemacs/text-modes
app-xemacs/xemacs-base
"
KEYWORDS="~alpha ~amd64 ~hppa ~ppc ~ppc64 ~sparc ~x86"

inherit xemacs-packages
