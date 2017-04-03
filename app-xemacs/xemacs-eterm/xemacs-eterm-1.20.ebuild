# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MY_PN=${PN/xemacs-/}
XEMACS_PKG_CAT="standard"

SLOT="0"
DESCRIPTION="Terminal emulation."

#XEMACS_EXPERIMENTAL=true
SRC_URI="http://ftp.xemacs.org/pub/xemacs/beta/experimental/packages/${MY_PN}-${PV}-pkg.tar.gz"

KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~sparc ~x86"

RDEPEND="app-xemacs/xemacs-base
"

inherit xemacs-packages
