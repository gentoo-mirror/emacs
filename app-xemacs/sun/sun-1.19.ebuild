# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

SLOT="0"
IUSE=""
DESCRIPTION="Support for Sparcworks.."
PKG_CAT="standard"

EXPERIMENTAL=true

MY_PN="Sun"
# SRC_URI="http://ftp.xemacs.org/packages/${MY_PN}-${PV}-pkg.tar.gz"
SRC_URI="http://ftp.xemacs.org/pub/xemacs/beta/experimental/packages/${MY_PN}-${PV}-pkg.tar.gz"

RDEPEND="app-xemacs/cc-mode
app-xemacs/xemacs-base
"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~sparc ~x86"

inherit xemacs-packages
