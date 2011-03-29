# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
NEED_EMACS=22
EBZR_REPO_URI="bzr://cedet.bzr.sourceforge.net/bzrroot/cedet/code/trunk"

# Inherit bzr last so that bzr_src_unpack takes action
inherit elisp eutils bzr

DESCRIPTION="CEDET: Collection of Emacs Development Tools"
HOMEPAGE="http://cedet.sourceforge.net/"
SRC_URI=""

LICENSE="GPL-2 FDL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="!app-emacs/semantic
	!app-emacs/eieio
	!app-emacs/speedbar"

SITEFILE="50${PN}-gentoo.el"

src_compile() {
	emake -j1 EMACS="${EMACS}"
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
			*~ | .cvsignore | .ede-ignore | Makefile* | *.texi | *-script \
				| PRERELEASE_CHECKLIST | Project.ede | USING_CEDET_FROM_BZR \
				| USING_CEDET_FROM_CVS | gettodos.sh | test.dot | testdist.sh \
				| grammar-fw-ov.txt | grammar-fw-ov.dia)
				;;
			README | AUTHORS | *NEWS | INSTALL | *.txt | semanticdb.sh)
				docinto "${dir}"
				dodoc "${target}" ;;
			*.el | *.by | *.wy | *.clj)
				# install grammar sources along with the elisp files, since
				# the location where semantic expects them is not configurable
				insinto "${SITELISP}/${PN}/${dir}"
				doins "${target}" ;;
			*.elc)
				# we are in a subshell, so collecting in a variable won't work
				echo "${target}" >>"${T}/elc-list.txt" ;;
			*.srt | *.xpm)
				insinto "${SITEETC}/${PN}/${dir}"
				doins "${target}" ;;
			*.info* | grammar-fw-ov.png)
				doinfo "${target}" ;;
			*)
				# don't die in the live ebuild since upstream may add files
				# die "Unrecognised file ${target}" ;;
				ewarn "Unrecognised file ${target}" ;;
		esac
	done

	# make sure that the compiled elisp files have a later time stamp than
	# the corresponding sources, in order to suppress warnings at run time
	while read target; do
		dir=${target%/*}; dir=${dir#./}
		insinto "${SITELISP}/${PN}/${dir}"
		doins "${target}"
	done <"${T}/elc-list.txt"

	elisp-site-file-install "${FILESDIR}/${SITEFILE}" || die
}
