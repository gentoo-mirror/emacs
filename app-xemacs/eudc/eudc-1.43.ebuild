# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

SLOT="0"
IUSE=""
DESCRIPTION="Emacs Unified Directory Client (LDAP, PH)."
PKG_CAT="standard"

EXPERIMENTAL=true

RDEPEND="app-xemacs/fsf-compat
app-xemacs/xemacs-base
app-xemacs/bbdb
app-xemacs/mail-lib
app-xemacs/gnus
app-xemacs/rmail
app-xemacs/tm
app-xemacs/apel
app-xemacs/xemacs-eterm
app-xemacs/sh-script
app-xemacs/net-utils
app-xemacs/ecrypto
"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~sparc ~x86"

inherit xemacs-packages
