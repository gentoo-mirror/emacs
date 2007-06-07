# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp versionator eutils

DEBIAN_PV="$(get_version_component_range 1-2)-hg$(get_version_component_range 3)"
DEBIAN_PR="$(get_version_component_range 4)"
DEBIAN_P="${PN}_${DEBIAN_PV}"
DEBIAN_PF="${DEBIAN_P}-${DEBIAN_PR}"
DEBIAN_BASE="mirror://debian/pool/main/${PN:0:1}/${PN}/"

DESCRIPTION="Quilt mode for Emacs -- With Debian patches"
HOMEPAGE="http://www.selenic.com/repo/quilt-el"

IUSE=""
LICENSE="GPL-2"
SLOT="0"

KEYWORDS="~amd64 ~x86"

RDEPEND="dev-util/quilt"

SRC_URI="${DEBIAN_BASE}/${DEBIAN_P}.orig.tar.gz
	${DEBIAN_BASE}/${DEBIAN_PF}.diff.gz"

S="${WORKDIR}/${DEBIAN_P/_/-}.orig"

src_unpack() {
	unpack ${A}
	cd "${WORKDIR}"
	epatch "${WORKDIR}/${DEBIAN_PF}.diff"

	cd "${S}"

	# Name the three patches explicitly because the fix-keybinds patch is not
	# a really good idea, at least it doesn't work for me.
	epatch \
		"${S}/debian/patches/handle-special-case.patch" \
		"${S}/debian/patches/fix-modeline-update-on-revering-buffers.patch" \
		"${S}/debian/patches/fix-quilt-edit-series-on-specific-buffer.patch"
}

src_compile() {
	elisp-compile quilt.el || die "Failed to compile quilt.el"
}

src_install() {
	elisp-install ${PN} *.elc *.el || die "elisp-install failed!"

	elisp-site-file-install "${FILESDIR}/50quilt-el-gentoo.el"

	dodoc debian/README.Debian
}
