# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit elisp

DESCRIPTION="Quilt mode for Emacs"
HOMEPAGE="http://stakeuchi.sakura.ne.jp/dev/quilt-el/"
SRC_URI="http://stakeuchi.sakura.ne.jp/dev/quilt-el/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-util/quilt"

S="${WORKDIR}/${PN}"
SITEFILE=50${PN}-gentoo.el
DOCS="README changelog"
