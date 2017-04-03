# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

SLOT="0"
DESCRIPTION="Support for Sparcworks.."
XEMACS_PKG_CAT="standard"

XEMACS_EXPERIMENTAL=true

MY_PN="Sun"
# SRC_URI="http://ftp.xemacs.org/packages/${MY_PN}-${PV}-pkg.tar.gz"
SRC_URI="http://ftp.xemacs.org/pub/xemacs/beta/experimental/packages/${MY_PN}-${PV}-pkg.tar.gz"

RDEPEND="app-xemacs/cc-mode
app-xemacs/xemacs-base
"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~sparc ~x86"

inherit xemacs-packages
