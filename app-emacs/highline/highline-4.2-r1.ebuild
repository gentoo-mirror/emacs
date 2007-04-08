# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="Minor mode to highlight current line in buffer"
HOMEPAGE="http://www.emacswiki.org/cgi-bin/wiki/HighlineMode"
# taken from: http://www.emacswiki.org/cgi-bin/emacs/download/${PN}.el
SRC_URI="mirror://gentoo/${P}.tar.bz2"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~ppc ~s390 ~x86"
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
