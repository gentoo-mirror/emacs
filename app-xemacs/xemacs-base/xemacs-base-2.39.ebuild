# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-xemacs/xemacs-base/xemacs-base-2.27.ebuild,v 1.8 2012/06/02 14:11:37 aballier Exp $

EAPI=5

SLOT="0"
IUSE=""
DESCRIPTION="Fundamental XEmacs support, you almost certainly need this."
PKG_CAT="standard"

EXPERIMENTAL=true

KEYWORDS="~alpha ~amd64 ~hppa ~ppc ~ppc64 ~sparc ~x86 ~amd64-fbsd"

inherit xemacs-packages
