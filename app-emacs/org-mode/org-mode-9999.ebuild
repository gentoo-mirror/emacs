# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

NEED_EMACS=23

inherit elisp

if [[ ${PV} = 9999 ]]; then
	EGIT_REPO_URI="git://orgmode.org/org-mode.git"
	EGIT_CHECKOUT_DIR="${WORKDIR}/org"
	inherit git-r3
	S="${WORKDIR}/org"
else
	SRC_URI="http://orgmode.org/org-${PV}.tar.gz"
	S="${WORKDIR}/org-${PV}"
fi

DESCRIPTION="An Emacs mode for notes and project planning"
HOMEPAGE="http://www.orgmode.org/"

LICENSE="GPL-3+ FDL-1.3+ contrib? ( GPL-2+ MIT ) odt-schema? ( OASIS-Open )"
SLOT="0"
IUSE="contrib doc odt-schema"
RESTRICT="test"

DEPEND="doc? ( virtual/texi2dvi )"
if [[ ${PV} = 9999 ]]; then
	DEPEND="${DEPEND}
		dev-lang/perl"
fi

SITEFILE="50${PN}-gentoo.el"

src_compile() {
	emake datadir="${EPREFIX}${SITEETC}/${PN}"
	use doc && emake pdf card
}

src_install() {
	emake \
		DESTDIR="${D}" \
		ETCDIRS="styles $(use odt-schema && echo schema)" \
		lispdir="${EPREFIX}${SITELISP}/${PN}" \
		datadir="${EPREFIX}${SITEETC}/${PN}" \
		infodir="${EPREFIX}/usr/share/info" \
		install

	cp "${FILESDIR}/${SITEFILE}" "${T}/${SITEFILE}"

	if use contrib; then
		elisp-install ${PN}/contrib contrib/lisp/{org,ob,ox}*.el
		insinto /usr/share/doc/${PF}/contrib
		doins -r contrib/README contrib/scripts
		find "${ED}/usr/share/doc/${PF}/contrib" -type f -name '.*' \
			-exec rm -f '{}' '+'
		# add the contrib subdirectory to load-path
		sed -i -e 's:\(.*@SITELISP@\)\(.*\):&\n\1/contrib\2:' \
			"${T}/${SITEFILE}" || die
	fi

	elisp-site-file-install "${T}/${SITEFILE}"
	dodoc README doc/library-of-babel.org etc/ORG-NEWS
	[[ ${PV} = 9999 ]] || dodoc doc/orgcard.txt
	use doc && dodoc doc/org.pdf doc/orgcard.pdf doc/orgguide.pdf
}
