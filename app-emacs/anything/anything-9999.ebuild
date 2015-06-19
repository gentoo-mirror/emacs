# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit elisp

if [[ ${PV} = 9999 ]]; then
	EGIT_REPO_URI="git://repo.or.cz/anything-config.git"
	EGIT_CHECKOUT_DIR="${WORKDIR}/anything-config"
	inherit git-r3
else
	# snapshot from upstream git repo
	SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.tar.gz"
fi

DESCRIPTION="Open anything - QuickSilver-like candidate-selection framework"
HOMEPAGE="http://www.emacswiki.org/emacs/Anything"

LICENSE="GPL-3+"
SLOT="0"
IUSE="extensions"

S="${WORKDIR}/anything-config"
SITEFILE="50${PN}-gentoo.el"

src_compile() {
	elisp-compile *.el || die
	elisp-make-autoload-file || die

	if use extensions; then
		BYTECOMPFLAGS="-L . -L extensions" elisp-compile extensions/*.el || die
	fi
}

src_install() {
	elisp-install ${PN} *.{el,elc} || die
	elisp-site-file-install "${FILESDIR}/${SITEFILE}" || die

	if use extensions; then
		elisp-install ${PN} extensions/*.{el,elc} || die
	fi

	dodoc README doc/anything.pdf
}
