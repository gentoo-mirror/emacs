# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

SLOT="0"
IUSE=""
DESCRIPTION="Spell-checking with GNU ispell."
PKG_CAT="standard"

# EXPERIMENTAL=true

MY_PN=${PN/xemacs-/}

SRC_URI="http://ftp.xemacs.org/pub/xemacs/beta/experimental/packages/${MY_PN}-${PV}-pkg.tar.gz"

RDEPEND=""
KEYWORDS="~alpha ~amd64 ~hppa ~ppc ~ppc64 ~sparc ~x86"

inherit xemacs-packages
