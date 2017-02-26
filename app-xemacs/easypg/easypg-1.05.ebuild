# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

SLOT="0"
IUSE=""
DESCRIPTION="GnuPG interface for Emacs."
PKG_CAT="standard"

KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~sparc ~x86"

EXPERIMENTAL=true

RDEPEND="app-xemacs/xemacs-base
app-xemacs/dired
app-xemacs/mail-lib
"

inherit xemacs-packages
