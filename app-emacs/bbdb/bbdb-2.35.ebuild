# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp-common

IUSE="crypt tetex"

DESCRIPTION="The Insidious Big Brother Database"
HOMEPAGE="http://bbdb.sourceforge.net/"

SRC_URI="http://bbdb.sourceforge.net/${P}.tar.gz
	http://www.mit.edu/afs/athena/contrib/emacs-contrib/Fin/point-at.el
	http://www.mit.edu/afs/athena/contrib/emacs-contrib/Fin/dates.el"
LICENSE="GPL-2 as-is"
SLOT="0"
KEYWORDS="-*"

DEPEND="virtual/emacs"
RDEPEND="${DEPEND}
	crypt? ( app-emacs/mailcrypt )
	tetex? ( virtual/tetex )"

SITEFILE=50bbdb-gentoo.el

src_unpack() {
	unpack ${P}.tar.gz
	cd "${S}"

	sed -i -e '0,/^--- bbdb-mail-folders.el ---$/d;/^--- end ---$/,$d' \
		bits/bbdb-mail-folders.el
	sed -i -e '/^;/,$!d' bits/bbdb-sort-mailrc.el
	cp ${DISTDIR}/{dates,point-at}.el bits

	if ! use crypt; then
		rm bits/bbdb-pgp.el
		elog "Excluding bits/bbdb-pgp.el because the \"crypt\" USE flag"
		elog "was not specified."
	fi
}

src_compile() {
	econf || die "econf failed"
	emake -j1 || die "emake failed"

	cat >${T}/lp.el <<-EOF
		(add-to-list 'load-path "${S}/bits")
		(add-to-list 'load-path "${S}/lisp")
	EOF
	emacs -batch -no-site-file -l ${T}/lp.el \
		-f batch-byte-compile bits/*.el || die "make bits failed"
}

src_install() {
	elisp-install ${PN} lisp/*.el{,c} || die
	elisp-install ${PN}/bits bits/*.el{,c} || die
	elisp-site-file-install "${FILESDIR}/${SITEFILE}" || die
	doinfo texinfo/*.info*
	dodoc ChangeLog INSTALL README bits/*.txt
	newdoc bits/README README.bits
	if use tetex; then
		insinto /usr/share/texmf/tex/bbdb
		doins tex/*.tex
	fi
}

pkg_postinst() {
	elisp-site-regen
	use tetex && texconfig rehash
}

pkg_postrm() {
	elisp-site-regen
	use tetex && texconfig rehash
}
