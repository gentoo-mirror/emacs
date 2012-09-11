# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit toolchain-funcs

DESCRIPTION="Micro GNU/emacs, a port from the BSDs"
HOMEPAGE="http://homepage.boetes.org/software/mg/"
SRC_URI="http://homepage.boetes.org/software/mg/${P}.tar.gz"

LICENSE="public-domain BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ppc ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~x86-macos"
IUSE="livecd"

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"

src_prepare() {
	# remove OpenBSD specific stuff
	sed -i -e 's/theo\.o//' Makefile.in || die
	sed -i -e '/theo_init/d' main.c || die
}

src_configure() {
	# econf won't work, as this script does not accept any parameters
	./configure || die "configure failed"
}

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
}

src_install()  {
	einstall
	dodoc README tutorial
}

pkg_postinst() {
	if use livecd; then
		[[ -e ${EROOT}/usr/bin/emacs ]] || ln -s mg "${EROOT}"/usr/bin/emacs
	fi
}