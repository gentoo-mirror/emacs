# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit elisp

MY_P="erc-${PV}-extras"
DESCRIPTION="The Emacs IRC Client"
HOMEPAGE="http://www.emacswiki.org/emacs/ErcExtraModules"
SRC_URI="http://ftp.gnu.org/old-gnu/erc/${MY_P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${MY_P}"
SITEFILE="50${PN}-gentoo.el"
DOCS="README.extras"

src_compile() {
	# erc-speak fails byte-compilation, cannot open emacspeak
	elisp-compile erc-{bbdb,chess,list-old,nicklist}.el
}

src_install() {
	elisp_src_install
	insinto "${SITEETC}/${PN}"
	doins -r images
}
