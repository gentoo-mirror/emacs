# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/docutils/docutils-0.4-r1.ebuild,v 1.5 2007/04/16 07:24:18 corsair Exp $

inherit elisp

DESCRIPTION="ReStructuredText support for Emacs"
HOMEPAGE="http://www.emacswiki.org/cgi-bin/wiki/reStructuredText"
SRC_URI="mirror://sourceforge/docutils/docutils-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

SITEFILE=50${PN}-gentoo.el
DOCS="README.txt"

S="${WORKDIR}/docutils-${PV}/tools/editors/emacs"

# this can be removed once the new elisp.eclass is in the tree
src_install() {
	elisp-install ${PN} *.el *.elc
	elisp-site-file-install "${FILESDIR}/${SITEFILE}"
	if [ -n "${DOCS}" ]; then
		dodoc ${DOCS} || die "dodoc failed"
	fi
}
