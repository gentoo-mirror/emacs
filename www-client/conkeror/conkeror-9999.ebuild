# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git

DESCRIPTION="This is a sample skeleton ebuild file"
HOMEPAGE="http://conkeror.org"
SRC_URI=""
EGIT_REPO_URI="git://repo.or.cz/conkeror.git"

LICENSE="|| ( MPL-1.1 GPL-2 LGPL-2.1 )"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=net-libs/xulrunner-1.9"
RDEPEND="${DEPEND}"

src_compile() {
	emake CFLAGS="${CFLAGS}" || die
}

src_install() {
	insinto /usr/share/${PN}
	doins -r branding chrome components content defaults locale modules \
		search-engines application.ini Info.plist || die
	exeinto /usr/share/${PN}/contrib
	doexe contrib/run-conkeror || die
	dosym /usr/share/${PN}/contrib/run-conkeror /usr/bin/conkeror || die
	dobin conkeror-spawn-helper || die
	dodoc CREDITS || die
}
