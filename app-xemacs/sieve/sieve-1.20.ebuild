# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

SLOT="0"
DESCRIPTION="Manage Sieve email filtering scripts."
XEMACS_PKG_CAT="standard"

XEMACS_EXPERIMENTAL=true

RDEPEND="app-xemacs/xemacs-base
app-xemacs/mail-lib
app-xemacs/cc-mode
app-xemacs/sasl
app-xemacs/ecrypto
app-xemacs/sh-script
"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~sparc ~x86"

inherit xemacs-packages
