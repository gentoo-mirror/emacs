# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit toolchain-funcs

DESCRIPTION="An extended version of Xaw3d with support for Xft and UTF-8 fonts"
HOMEPAGE="http://sourceforge.net/projects/sf-xpaint/"
SRC_URI="mirror://sourceforge/project/sf-xpaint/sf-xpaint/${P/X/x}/${P/X/x}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="x11-libs/libXt
	x11-libs/libX11
	x11-libs/libXmu
	x11-libs/libXpm
	x11-libs/libXft"

DEPEND="${RDEPEND}
	x11-misc/imake
	x11-misc/gccmakedep"

S="${WORKDIR}/${PN}"

src_configure() {
	xmkmf || die
}

src_compile() {
	make includes || die
	make depend || die
	emake CC="$(tc-getCC)" \
		CDEBUGFLAGS="${CFLAGS}" \
		SHLIBGLOBALSFLAGS="${LDFLAGS}" || die
}

src_install() {
	make DESTDIR="${D}" install || die
	dodoc README.XAW3DXFT || die
}
