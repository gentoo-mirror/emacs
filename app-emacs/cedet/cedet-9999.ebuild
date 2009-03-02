# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

NEED_EMACS=22

ECVS_SERVER="cedet.cvs.sourceforge.net:/cvsroot/cedet"
ECVS_MODULE="cedet"
ECVS_AUTH="pserver"
ECVS_CVS_COMPRESS="-z3"
ECVS_LOCALNAME="cedet"

inherit eutils elisp cvs

DESCRIPTION="CEDET: Collection of Emacs Development Tools"
HOMEPAGE="http://cedet.sourceforge.net/"
SRC_URI=""

LICENSE="GPL-2 FDL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

DEPEND=""
RDEPEND="!app-emacs/semantic
	!app-emacs/eieio
	!app-emacs/speedbar"

S="${WORKDIR}/${ECVS_LOCALNAME}"
SITEFILE="50${PN}-gentoo.el"

src_unpack() {
	cvs_src_unpack
	cd "${S}"
	ecvs_clean
	find . -name Makefile | xargs touch
}

src_compile() {
	emake -j1 EMACS="${EMACS}" || die "emake failed"
}

#src_test() {
#	make utest || die "make utest failed"
#}

src_install() {
	local target file dir
	find . -type d \( -name tests -o -name www \) -prune -o -type f -print \
		| while read target
	do
		file=${target##*/}
		dir=${target%/*}; dir=${dir#./}
		case "${file}" in
			*~ | Makefile* | *.texi | *-script | PRERELEASE_CHECKLIST \
				| Project.ede | USING_CEDET_FROM_CVS | gettodos.sh \
				| test.dot | grammar-fw-ov.txt | grammar-fw-ov.dia)
				;;
			ChangeLog | README | AUTHORS | *NEWS | INSTALL | *.txt \
				| semanticdb.sh)
				docinto "${dir}"
				dodoc "${target}" || die ;;
			*.el | *.elc | *.by | *.wy)
				# install grammar sources along with the elisp files, since
				# the location where semantic expects them is not configurable
				insinto "${SITELISP}/${PN}/${dir}"
				doins "${target}" || die ;;
			*.srt | *.xpm)
				insinto "${SITEETC}/${PN}/${dir}"
				doins "${target}" || die ;;
			*.info* | grammar-fw-ov.png)
				doinfo "${target}" || die ;;
			*)
				# don't die in the live ebuild since upstream may add files
				# die "Unrecognised file ${target}" ;;
				ewarn "Unrecognised file ${target}" ;;
		esac
	done

	elisp-site-file-install "${FILESDIR}/${SITEFILE}" || die
}
