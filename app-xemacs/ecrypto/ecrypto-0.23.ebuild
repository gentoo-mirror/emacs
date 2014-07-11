# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-xemacs/ecrypto/ecrypto-0.21.ebuild,v 1.6 2011/07/22 11:25:05 xarthisius Exp $

EAPI=5

SLOT="0"
IUSE=""
DESCRIPTION="Crypto functionality in Emacs Lisp."
PKG_CAT="standard"

EXPERIMENTAL=true

RDEPEND="app-xemacs/xemacs-base
"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~sparc ~x86"

inherit xemacs-packages