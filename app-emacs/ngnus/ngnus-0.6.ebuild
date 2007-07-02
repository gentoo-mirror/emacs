# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="Current alpha branch of the Gnus news- and mail-reader"
HOMEPAGE="http://gnus.org/"
SRC_URI="http://gnus.org/dist/${P}.tar.gz"

LICENSE="GPL-2 FDL-1.2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="!app-emacs/gnus
		!app-emacs/gnus-cvs"
RDEPEND="${DEPEND}"

SITEFILE=70${PN}-gentoo.el

src_compile() {
	econf \
		--with-emacs --without-w3 --without-url \
		--with-lispdir=${SITELISP}/${PN} \
		--with-etcdir=/usr/share/emacs/etc \
		|| die "econf failed"
	emake || die "emake failed"
}

src_install() {
	einstall \
		lispdir="${D}${SITELISP}/${PN}" \
		etcdir="${D}/usr/share/emacs/etc" \
		|| die "einstall failed"

	# fix info documentation
	for i in "${D}"/usr/share/info/*; do
		mv ${i} ${i}.info || die "mv info failed"
	done

	elisp-site-file-install "${FILESDIR}/${SITEFILE}"

	dodoc ChangeLog GNUS-NEWS README todo || die "dodoc failed"
}
