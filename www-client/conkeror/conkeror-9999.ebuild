# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="git://repo.or.cz/conkeror.git"
EGIT_BRANCH="gecko26-downloads-fix"

inherit eutils git-r3 toolchain-funcs fdo-mime

DESCRIPTION="A Mozilla-based web browser whose design is inspired by GNU Emacs"
HOMEPAGE="http://conkeror.org/"
# conkeror.png is derived from http://commons.wikimedia.org/wiki/File:Conker.jpg
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/conkeror.png"

# CC-BY-SA-3.0 for conkeror.png
LICENSE="|| ( MPL-1.1 GPL-2 LGPL-2.1 ) CC-BY-SA-3.0"
SLOT="0"

RDEPEND="|| ( >=www-client/firefox-5.0 >=www-client/firefox-bin-23.0 )"

src_unpack() {
	git-r3_src_unpack
	cp "${DISTDIR}/conkeror.png" . || die
}

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}"
}

src_install() {
	insinto /usr/share/${PN}
	doins -r branding chrome components content defaults help locale modules \
		search-engines style tests
	doins application.ini *.manifest Info.plist

	exeinto /usr/libexec/${PN}
	doexe conkeror-spawn-helper
	dosym ../../libexec/${PN}/conkeror-spawn-helper \
		/usr/share/${PN}/conkeror-spawn-helper

	newbin "${FILESDIR}/conkeror.sh" conkeror
	domenu "${FILESDIR}/conkeror.desktop"
	doicon "${WORKDIR}/conkeror.png"

	doman contrib/man/conkeror.1
	dodoc CREDITS
}

pkg_postinst() {
	fdo-mime_desktop_database_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}
