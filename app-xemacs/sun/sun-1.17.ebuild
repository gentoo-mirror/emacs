# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-xemacs/sun/sun-1.16.ebuild,v 1.7 2011/07/22 11:25:03 xarthisius Exp $

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
