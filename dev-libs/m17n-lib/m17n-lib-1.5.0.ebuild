# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/m17n-lib/m17n-lib-1.3.4.ebuild,v 1.2 2007/07/22 08:25:23 graaff Exp $

inherit flag-o-matic

DESCRIPTION="Multilingual Library for Unix/Linux"
HOMEPAGE="http://www.m17n.org/m17n-lib/"
SRC_URI="http://www.m17n.org/m17n-lib-download/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ppc ~ppc64 ~sparc ~x86"
IUSE="gd"

DEPEND="x11-libs/libXaw
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libXrender
	x11-libs/libXft
	dev-libs/libxml2
	dev-libs/fribidi
	>=media-libs/freetype-2.1
	media-libs/fontconfig
	gd? ( media-libs/gd )
	>=dev-libs/libotf-0.9.2
	>=dev-db/m17n-db-${PV}"

pkg_setup() {
	if use gd && ! built_with_use media-libs/gd png ; then
		eerror "m17n-lib requires GD to be built with png support. Please add"
		eerror "'png' to your USE flags, and re-emerge media-libs/gd."
		die "Missing USE flag."
	fi
}

src_unpack() {
	unpack ${A}
	# internal-flt.h is missing in distfile, taken from upstream CVS
	cp "${FILESDIR}/internal-flt.h" "${S}/src/"
}

src_compile() {
	append-flags -fPIC
	econf $(use_with gd) || die
	emake -j1 || die
}

src_install() {
	emake DESTDIR="${D}" install || die

	dodoc AUTHORS ChangeLog INSTALL NEWS README TODO
}