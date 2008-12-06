# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="An Emacs minor mode for incremental viewing of LaTeX documents"
HOMEPAGE="http://cristal.inria.fr/whizzytex/"
SRC_URI="http://cristal.inria.fr/${PN}/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="advi xdvi gv doc examples"

DEPEND="virtual/latex-base
	advi? ( app-text/active-dvi )
	xdvi? ( app-text/xdvik )
	gv? ( app-text/gv )
	!advi? ( !xdvi? ( !gv? ( app-text/active-dvi ) ) )"
RDEPEND="${DEPEND}"

SITEFILE="50${PN}-gentoo.el"
TEXMF="/usr/share/texmf-site"

src_compile() {
	local advi=false xdvi=false gv=false
	use advi && advi=/usr/bin/advi
	use xdvi && xdvi=/usr/bin/xdvi
	use gv && gv=/usr/bin/gv

	if ! use advi && ! use xdvi && ! use gv; then
		ewarn "No previewer defined (USE=\"-advi -xdvi -gv\"), enabling advi"
		advi=/usr/bin/advi
	fi

	# hand-crafted configure, econf doesn't work
	./configure -prefix /usr \
		-emacsdir "${SITELISP}/${PN}" \
		-latexdir "${TEXMF}/tex/latex/${PN}" \
		-docdir /usr/share/doc/${PF} \
		-advi ${advi} -xdvi ${xdvi} -gv ${gv} \
		-emacs emacs -xemacs "" -elc \
		|| die "configure failed"

	# config.force is needed, otherwise checkconfig will try to call xdvi etc
	emake config.force || die
	emake all || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	rm -f "${D}"/usr/share/doc/${PF}/{COPYING,GPL}
	rm -rf "${D}"/usr/share/${PN}

	elisp-site-file-install "${FILESDIR}/${SITEFILE}" || die
	dodoc CHANGES || die "dodoc failed"

	if use doc; then
		dodoc doc/whizzytex.{ps,pdf} || die "dodoc failed"
	fi

	if use examples; then
		insinto /usr/share/doc/${PF}
		doins -r examples || die "doins failed"
	fi

	prepalldocs
}
