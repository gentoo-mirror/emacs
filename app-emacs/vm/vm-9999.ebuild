# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EBZR_REPO_URI="http://www.robf.de/Hacking/bazaar/vm-repo/"
EBZR_BRANCH="vm-trunk"

inherit elisp eutils bzr autotools

DESCRIPTION="The VM mail reader for Emacs"
HOMEPAGE="http://www.nongnu.org/viewmail/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="bbdb ssl"

DEPEND="bbdb? ( app-emacs/bbdb )"
RDEPEND="${DEPEND}
	ssl? ( net-misc/stunnel )"

SITEFILE=50${PN}-gentoo.el

src_unpack() {
	bzr_src_unpack
	cd "${S}"

	if ! use bbdb; then
		elog "Excluding vm-pcrisis.el since the \"bbdb\" USE flag is not set."
		epatch "${FILESDIR}/vm-no-pcrisis.patch"
	fi

	eautoreconf
}

src_compile() {
	local myconf
	use bbdb && myconf="--with-other-dirs=${SITELISP}/bbdb"
	econf --with-emacs="emacs" \
		--with-pixmapdir="/usr/share/pixmaps/vm" \
		${myconf} || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake -j1 DESTDIR="${D}" install || die "emake install failed"
	elisp-site-file-install "${FILESDIR}/${SITEFILE}"
	dodoc NEWS README TODO example.vm || die "dodoc failed"
}
