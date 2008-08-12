# Copyright 1999-2008 Gentoo Foundation
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

DEPEND="!app-emacs/semantic
	!app-emacs/eieio
	!app-emacs/speedbar"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${ECVS_LOCALNAME}"

SITEFILE=60${PN}-gentoo.el

src_compile() {
	touch $(find . -name Makefile)
	emake EMACS=/usr/bin/emacs || die "emake failed"
}

src_install() {
	ecvs_clean
	find "${S}" -type f -print | grep -v www | while read target; do
		local directory=$(dirname ${target}) file=$(basename ${target})
		local sub_directory=$(echo ${directory} | sed "s%^${S}/*%%;s/^$/./")
		case $file in
			*~ | Makefile* | *.texi | *-script | PRERELEASE_CHECKLIST \
				| Project.ede | IMPLICIT_TARGETS | USING_CEDET_FROM_CVS)
				;;
			ChangeLog | README | AUTHORS | *NEWS | INSTALL)
				docinto ${sub_directory}
				dodoc ${target}
				;;
			# Only one file: grammar-fw-ov.png, referenced by grammar-fw.info
			# Should be installed along with *.info or not at all
			#*.png)
			#	insinto /usr/share/doc/${PF}/${sub_directory}
			#	doins ${target}
			#	;;
			*.el | *.elc)
				insinto ${SITELISP}/${PN}/${sub_directory}
				doins ${target}
				;;
			*.info*)
				doinfo ${target}
				;;
			*)
				insinto ${SITELISP}/${PN}/${sub_directory}
				doins ${target}
				echo ${target} >>"${S}/IMPLICIT_TARGETS"
				;;
		esac
	done

	elisp-site-file-install "${FILESDIR}/${SITEFILE}"
}
