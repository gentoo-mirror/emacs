# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="Quote text with a semi-box"
HOMEPAGE="http://www.davep.org/emacs/"
SRC_URI="mirror://gentoo/${P}.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~x86 ~amd64 ~ppc ~ppc64"
IUSE=""

SITEFILE=51${PN}-gentoo.el

src_compile() {
	local al="${S}/${PN}-autoloads.el"
	echo >${al}
	emacs --batch -q --no-site-file \
		--eval "(setq generated-autoload-file \"${al}\")" \
		-f batch-update-autoloads "${S}" \
		|| die "batch-update-autoloads failed"

	elisp-compile *.el || die "elisp-compile failed"
}
