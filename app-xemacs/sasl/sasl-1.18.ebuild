# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

SLOT="0"
IUSE=""
DESCRIPTION="Simple Authentication and Security Layer (SASL) library."
PKG_CAT="standard"

EXPERIMENTAL=true

RDEPEND="app-xemacs/ecrypto
"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~sparc ~x86"

inherit xemacs-packages
