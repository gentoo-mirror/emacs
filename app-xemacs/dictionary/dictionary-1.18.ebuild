# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-xemacs/dictionary/dictionary-1.16.ebuild,v 1.3 2007/06/03 17:58:00 graaff Exp $

EAPI=5

SLOT="0"
IUSE=""
DESCRIPTION="Interface to RFC2229 dictionary servers."
PKG_CAT="standard"

EXPERIMENTAL=true

RDEPEND="app-xemacs/xemacs-base
"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~sparc ~x86"

inherit xemacs-packages
