# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit elisp eutils autotools toolchain-funcs

DESCRIPTION="Remembrance Agent plugin for Emacs"
HOMEPAGE="http://www.remem.org/index.html
	https://projects.pekdon.net/projects/remem"
# Snapshot of git repo (master branch) at
# https://projects.pekdon.net/projects/remem/repository
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~sparc ~x86"
IUSE="pcre zlib"

DEPEND="pcre? ( dev-libs/libpcre )
	zlib? ( sys-libs/zlib )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"
SITEFILE="50${PN}-gentoo.el"

src_prepare() {
	epatch "${FILESDIR}/${PN}-2.12-glibc-2.10.patch"
	eautoreconf
}

src_configure() {
	tc-export CC AR RANLIB
	econf --with-lispdir="${SITELISP}/${PN}" \
		$(use_with pcre) \
		$(use_with zlib zlib /usr)
}

src_compile() {
	emake -j1 || die "emake failed"
}

src_install () {
	emake -j1 DESTDIR="${D}" lib_LIBRARIES="" install \
		|| die "emake install failed"
	elisp-site-file-install "${FILESDIR}/${SITEFILE}" || die
	doman other/ra-{index,retrieve}.1 || die
	dodoc AUTHORS ChangeLog NEWS README
}

pkg_postinst() {
	elisp-site-regen
	echo
	elog "See the README file in /usr/share/doc/${PF}"
	elog "for instructions how to use the Remembrance Agent."
}
