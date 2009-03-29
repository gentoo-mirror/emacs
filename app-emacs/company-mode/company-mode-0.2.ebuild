# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
NEED_EMACS=22

inherit elisp

DESCRIPTION="In-buffer completion front-end"
HOMEPAGE="http://nschum.de/src/emacs/company-mode/"
SRC_URI="http://nschum.de/src/emacs/${PN}/company-${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="oddmuse semantic"

DEPEND="oddmuse? ( app-emacs/oddmuse )
	semantic? ( app-emacs/cedet )"
RDEPEND="${DEPEND}"

S="${WORKDIR}"
SITEFILE="50${PN}-gentoo.el"

src_prepare() {
	# Disable backends that require extra dependencies, unless they are
	# selected by the respective USE flag
	local backend
	for backend in oddmuse semantic; do
		if ! use ${backend}; then
			einfo "Disabling ${backend} backend"
			rm company-${backend}.el || die
			sed -i -e "s/company-${backend} *//" company.el || die
		fi
	done
}
