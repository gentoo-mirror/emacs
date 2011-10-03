# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emacs/slime/slime-2.0_p20101103.ebuild,v 1.1 2010/11/21 11:13:48 ulm Exp $

EAPI=4

inherit elisp

if [[ ${PV} = 9999 ]]; then
	EGIT_REPO_URI="git://repo.or.cz/anything-config.git"
	inherit git-2
else
	# snapshot from upstream git repo
	SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.tar.gz"
	S="${WORKDIR}/anything-config"
fi

DESCRIPTION="Open anything - QuickSilver-like candidate-selection framework"
HOMEPAGE="http://www.emacswiki.org/emacs/Anything"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="extensions"

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