# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MY_PN=${PN/xemacs-/}
PKG_CAT="standard"

SLOT="0"
IUSE=""
DESCRIPTION="Terminal emulation."

# EXPERIMENTAL=true
SRC_URI="http://ftp.xemacs.org/pub/xemacs/beta/experimental/packages/${MY_PN}-${PV}-pkg.tar.gz"

KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~sparc ~x86"

RDEPEND="app-xemacs/xemacs-base
"

inherit xemacs-packages
