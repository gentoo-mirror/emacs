# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Auxiliary editor script"
HOMEPAGE="http://www.gentoo.org/"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_install() {
	exeinto /usr/libexec
	newexe "${FILESDIR}/${P}.sh" gentoo-editor || die
}
