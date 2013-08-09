# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="git://git.overlays.gentoo.org/proj/emacs-tools.git"
EGIT_BRANCH="${PN}"

inherit git-2

DESCRIPTION="Rebuild Emacs packages"
HOMEPAGE="http://wiki.gentoo.org/wiki/Project:Emacs"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~ia64-linux ~x86-linux ~ppc-macos ~x86-macos"

RDEPEND=">=app-portage/portage-utils-0.3
	virtual/emacs"

S="${WORKDIR}/${PN}"

src_prepare() {
	if [[ -n ${EPREFIX} ]]; then
		sed -i -e "1s:/:${EPREFIX%/}/:" \
			-e "s:^\(EMACS\|SITELISP\)=:&${EPREFIX%/}:" \
			emacs-updater || die
	fi
}

src_install() {
	dosbin emacs-updater
	doman emacs-updater.8
}
