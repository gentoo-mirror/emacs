# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit elisp

DESCRIPTION="Major mode for editing Nagios configuration files"
HOMEPAGE="http://michael.orlitzky.com/code/nagios-mode.php"
SRC_URI="http://michael.orlitzky.com/code/releases/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS="ChangeLog README test_suite.cfg"
SITEFILE="50${PN}-gentoo.el"
