# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
NEED_EMACS=22

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
KEYWORDS="~amd64 ~ppc ~x86 ~x86-fbsd ~x86-macos"
IUSE="contrib doc odt-schema"

DEPEND="doc? ( virtual/texi2dvi )"
if [[ ${PV} = 9999 ]]; then
	DEPEND="${DEPEND}
		dev-lang/perl"
else
	# Remove autoload file to make sure that it is regenerated with
	# the right Emacs version.
	ELISP_REMOVE="lisp/org-install.el"
fi

SITEFILE="50${PN}-gentoo.el"

src_compile() {
	emake
	use doc && emake pdf card
}

src_install() {
	emake \
		DESTDIR="${D}" \
		ETCDIRS="styles $(use odt-schema && echo schema)" \
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
	dodoc README etc/ORG-NEWS
	use doc && dodoc doc/org.pdf doc/orgcard.pdf doc/orgguide.pdf
}
