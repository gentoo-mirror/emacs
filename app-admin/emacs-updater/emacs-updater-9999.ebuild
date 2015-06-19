# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="git://anongit.gentoo.org/proj/emacs-tools.git"
EGIT_BRANCH="${PN}"
EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"

inherit git-r3

DESCRIPTION="Rebuild Emacs packages"
HOMEPAGE="http://wiki.gentoo.org/wiki/Project:Emacs"

LICENSE="GPL-2+"
SLOT="0"

DEPEND="|| ( sys-apps/util-linux app-misc/getopt )"
RDEPEND="${DEPEND}
	>=app-portage/portage-utils-0.3
	virtual/emacs"

S="${WORKDIR}/${PN}"

src_prepare() {
	if ! has_version sys-apps/util-linux; then
		# BSD ships a dumb getopt(1), so use getopt-long instead
		sed -i -e '/^GETOPT=/s/getopt/&-long/' emacs-updater || die
	fi

	if [[ -n ${EPREFIX} ]]; then
		sed -i -e "1s:/:${EPREFIX%/}/:" \
			-e "s:^\([[:upper:]]*=\)/:\1${EPREFIX%/}/:" \
			emacs-updater || die
	fi
}

src_install() {
	dosbin emacs-updater
	doman emacs-updater.8
}
