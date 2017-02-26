# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

SLOT="0"
IUSE=""
DESCRIPTION="MULE: Lisp Interface to EDICT, Kanji Dictionary"
PKG_CAT="mule"

EXPERIMENTAL=true

RDEPEND="app-xemacs/mule-base
app-xemacs/xemacs-base
"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~sparc ~x86"

inherit xemacs-packages
