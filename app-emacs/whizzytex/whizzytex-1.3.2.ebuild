# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp

DESCRIPTION="An Emacs minor mode for incremental viewing of LaTeX documents"
HOMEPAGE="http://cristal.inria.fr/whizzytex/"
SRC_URI="http://cristal.inria.fr/${PN}/${P}.tgz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples gv xdvi"

RDEPEND="virtual/latex-base
	xdvi? ( app-text/xdvik )
	gv? ( app-text/gv )
	!xdvi? ( !gv? ( app-text/xdvik ) )"
DEPEND="${RDEPEND}"

SITEFILE="50${PN}-gentoo.el"
TEXMF="/usr/share/texmf-site"

src_configure() {
	local xdvi gv
	use xdvi && xdvi=/usr/bin/xdvi
	use gv && gv=/usr/bin/gv

	if [[ -z ${xdvi}${gv} ]]; then
		ewarn "No previewer defined (USE=\"-xdvi -gv\"), enabling xdvi"
		xdvi=/usr/bin/xdvi
	fi

	# hand-crafted configure, econf doesn't work
	./configure \
		-prefix /usr \
		-emacsdir "${SITELISP}/${PN}" \
		-latexdir "${TEXMF}/tex/latex/${PN}" \
		-docdir /usr/share/doc/${PF} \
		-initex "pdfetex -ini" \
		-advi false \
		-xdvi ${xdvi:-false} \
		-gv ${gv:-false} \
		-emacs emacs \
		-xemacs "" \
		-elc \
		|| die "configure failed"

	# disable XEmacs support (not completely possible in configure)
	sed -i -e "/^XEMACSDIR/s/=.*/=/" Makefile.config || die
}

src_compile() {
	# config.force is needed, otherwise checkconfig will try to call xdvi etc
	emake config.force
	emake all
}

src_install() {
	emake DESTDIR="${D}" install
	rm -f "${ED}"/usr/share/doc/${PF}/{COPYING,GPL}

	elisp-site-file-install "${FILESDIR}/${SITEFILE}"
	dodoc CHANGES

	if use doc; then
		dodoc doc/whizzytex.{ps,pdf}
	fi

	if use examples; then
		insinto /usr/share/doc/${PF}
		doins -r examples
	fi
}
