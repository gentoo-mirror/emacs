# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit elisp

DESCRIPTION="Type-ahead support for emacs-w3m"
HOMEPAGE="http://mph-emacs-pkgs.alioth.debian.org/WthreemTypeAheadEl.html"
SRC_URI="http://alioth.debian.org/frs/download.php/1755/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-emacs/emacs-w3m"
RDEPEND="${DEPEND}"

SITEFILE=50${PN}-gentoo.el
