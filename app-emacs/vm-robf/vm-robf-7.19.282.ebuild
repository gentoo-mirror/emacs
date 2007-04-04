# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp eutils versionator

VM_PV=$(get_version_component_range 1-2 ${PV})
VM_P=vm-${VM_PV}

DESCRIPTION="An Emacs major mode for reading and writing e-mail with support for GPG and MIME"
HOMEPAGE="http://www.robf.de/Hacking/elisp/"
SRC_URI="ftp://ftp.uni-mainz.de/pub/software/gnu/vm/${VM_P}.tar.gz
	http://www.robf.de/Hacking/elisp/${VM_P}.patch.gz"
### mirror://gentoo/${P}.patch.gz

LICENSE="GPL-1"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="!app-emacs/vm"

S="${WORKDIR}/${VM_P}"

SITEFILE=51vm-gentoo.el

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${WORKDIR}/${VM_P}.patch" ### change to ${P}.patch
	epatch "${FILESDIR}/vm-direntry-fix-gentoo.patch"
}

src_compile() {
	make CC=$(tc-getCC) \
		prefix="${D}/usr" \
		INFODIR="${D}/usr/share/info" \
		LISPDIR="${D}/${SITELISP}/vm" \
		PIXMAPDIR="${D}/usr/share/pixmaps/vm" \
		all || die "compilation failed"
}

src_install() {
	make prefix="${D}/usr" \
		INFODIR="${D}/usr/share/info" \
		LISPDIR="${D}/${SITELISP}/vm" \
		PIXMAPDIR="${D}/usr/share/pixmaps/vm" \
		install || die "installation failed"
	elisp-install vm *.el
	elisp-site-file-install "${FILESDIR}/${SITEFILE}"
	dodoc README ChangeLog oldChangeLog TODO #patchdoc.txt
}
