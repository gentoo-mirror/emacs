# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EBZR_REPO_URI="http://bzr.xsteve.at/dvc/"
EBZR_BRANCH="."

inherit elisp autotools bzr

DESCRIPTION="New version control backend for distributed systems (like bzr, git)"
HOMEPAGE="http://download.gna.org/dvc/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

SITEFILE=50${PN}-gentoo.el

src_unpack() {
	bzr_src_unpack
	cd "${S}"
	eautoreconf
}

src_compile() {
	econf --with-lispdir="${D}/${SITELISP}/${PN}" --infodir="${D}/usr/share/info" \
		|| die "econf failed"
	emake || die "emake failed"
}
src_install() {
	emake DESTDIR="${D}" install
	elisp-site-file-install "${FILESDIR}/${SITEFILE}"
}