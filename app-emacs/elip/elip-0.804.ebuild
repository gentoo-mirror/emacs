# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

NEED_EMACS=22

inherit elisp

DESCRIPTION="The Emacs Learning Instruction Program"
HOMEPAGE="http://www.gnuvola.org/software/elip/"
SRC_URI="http://www.gnuvola.org/software/elip/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=app-emacs/edb-1.31"
RDEPEND="${DEPEND}"

SITEFILE=50${PN}-gentoo.el

# this is not redundant, since src_compile is redefined by elisp.eclass
src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	# the build system of the package is horribly broken,
	# so we install everything manually
	elisp-install ${PN} source/*.{el,elc} || die "elisp-install failed"
	elisp-site-file-install "${FILESDIR}/${SITEFILE}" \
		|| die "elisp-site-file-install failed"
	doinfo doc/elip.info*

	dodoc ChangeLog ChangeLog.OLD NEWS README
	insinto /usr/share/doc/${PF}
	doins doc/elip.pdf
	doins -r examples
}
