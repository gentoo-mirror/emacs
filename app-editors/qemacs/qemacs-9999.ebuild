# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs cvs

DESCRIPTION="QEmacs is a very small but powerful UNIX editor"
HOMEPAGE="https://savannah.nongnu.org/projects/qemacs/"

ECVS_SERVER="cvs.savannah.nongnu.org:/sources/qemacs"
ECVS_MODULE="qemacs"

LICENSE="LGPL-2.1+ GPL-2+"
SLOT="0"
IUSE="X png unicode xv"
RESTRICT="test"

RDEPEND="
	X? ( x11-libs/libX11
		x11-libs/libXext
		xv? ( x11-libs/libXv ) )
	png? ( >=media-libs/libpng-1.2:0= )"

DEPEND="${RDEPEND}
	>=app-text/texi2html-5"

S="${WORKDIR}/${PN}"

# upstream build system strips the binary
QA_PRESTRIPPED="/usr/bin/qemacs"

src_configure() {
	# Home-grown configure script, doesn't support most standard options
	./configure \
		--prefix=/usr \
		--mandir=/usr/share/man \
		--cc="$(tc-getCC)" \
		$(use_enable X x11) \
		$(use_enable png) \
		$(use_enable xv) || die
}

src_install() {
	emake install DESTDIR="${D}"
	dodoc Changelog README TODO.org config.eg
	docinto html
	dodoc qe-doc.html

	# Install headers so users can build their own plugins
	insinto /usr/include/qe
	doins *.h
	insinto /usr/include/qe/libqhtml
	doins libqhtml/*.h
}
