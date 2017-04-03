# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

SLOT="0"
DESCRIPTION="Spell-checking with GNU ispell."
XEMACS_PKG_CAT="standard"

#XEMACS_EXPERIMENTAL=true

MY_PN=${PN/xemacs-/}

SRC_URI="http://ftp.xemacs.org/pub/xemacs/beta/experimental/packages/${MY_PN}-${PV}-pkg.tar.gz"

RDEPEND=""
KEYWORDS="~alpha ~amd64 ~hppa ~ppc ~ppc64 ~sparc ~x86"

inherit xemacs-packages
