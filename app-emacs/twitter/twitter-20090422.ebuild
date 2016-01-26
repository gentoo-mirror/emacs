# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

inherit elisp

DESCRIPTION="Simple Emacs-based client for Twitter"
HOMEPAGE="http://www.busydoingnothing.co.uk/twitter-el/"
# Snapshot of git repo at git://git.busydoingnothing.co.uk/twitter.git
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.el.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

SITEFILE="50${PN}-gentoo.el"
