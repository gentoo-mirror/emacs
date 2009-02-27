# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="The GNU Emacs Lisp Reference Manual"
HOMEPAGE="http://www.gnu.org/software/emacs/manual/"
SRC_URI="mirror://gnu/emacs/emacs-${PV}.tar.gz"

LICENSE="FDL-1.2"
SLOT="22"
KEYWORDS="~amd64 ~ppc ~s390 ~sparc ~x86"
IUSE=""

S="${WORKDIR}/emacs-${PV}/lispref"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/${P}-direntry.patch"
}

src_compile() {
	makeinfo elisp.texi || die "makeinfo failed"
}

src_install() {
	doinfo elisp22.info* || die "doinfo failed"
	dodoc ChangeLog README
}
