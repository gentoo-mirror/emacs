# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
NEED_EMACS=22

inherit elisp

if [[ ${PV} = 9999 ]]; then
	EGIT_REPO_URI="git://orgmode.org/org-mode.git"
	inherit git-2
else
	SRC_URI="http://orgmode.org/org-${PV}.tar.gz"
fi

DESCRIPTION="An Emacs mode for notes and project planning"
HOMEPAGE="http://www.orgmode.org/"

LICENSE="GPL-3 FDL-1.3 contrib? ( GPL-2 MIT as-is )"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~x86-fbsd ~x86-macos"
IUSE="contrib"

DEPEND=""
RDEPEND=""
if [[ ${PV} = 9999 ]]; then
	# additional build time dependencies for perl and TeX
	DEPEND="${DEPEND}
		dev-lang/perl
		virtual/tex-base
		virtual/texi2dvi"
else
	# Remove autoload file to make sure that it is regenerated with
	# the right Emacs version.
	ELISP_REMOVE="lisp/org-install.el"
fi

S="${WORKDIR}/org-${PV}"
SITEFILE="50${PN}-gentoo.el"

src_compile() {
	emake datadir="${SITEETC}/${PN}"

	if [[ ${PV} = 9999 ]]; then
		emake info pdf card
	fi
}

src_install() {
	emake \
		prefix="${ED}/usr" \
		lispdir="${ED}${SITELISP}/${PN}" \
		datadir="${ED}${SITEETC}/${PN}" \
		infodir="${ED}/usr/share/info" \
		install

	cp "${FILESDIR}/${SITEFILE}" "${T}/${SITEFILE}"

	if use contrib; then
		elisp-install ${PN}/contrib contrib/lisp/*org*.el || die
		insinto /usr/share/doc/${PF}/contrib
		doins -r contrib/README contrib/babel contrib/scripts
		find "${ED}/usr/share/doc/${PF}/contrib" -type f -name '.*' \
			-exec rm -f '{}' '+'
		# add the contrib subdirectory to load-path
		sed -ie 's:\(.*@SITELISP@\)\(.*\):&\n\1/contrib\2:' \
			"${T}/${SITEFILE}" || die
	fi

	elisp-site-file-install "${T}/${SITEFILE}" || die
	doinfo doc/org
	dodoc README doc/org.pdf doc/orgcard.pdf doc/orgguide.pdf
}
