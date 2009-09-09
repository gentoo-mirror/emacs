# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit elisp eutils

DESCRIPTION="Yet another GIT Emacs mode for newbies"
HOMEPAGE="http://tsgates.cafe24.com/git/git-emacs.html"
SRC_URI="http://tsgates.cafe24.com/git/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-util/git"
RDEPEND="${DEPEND}"

src_prepare() {
	# Remove bundled git-blame.el, it is installed by dev-util/git
	rm -f git-blame.el
	epatch "${FILESDIR}/${P}-no-hyphen.patch"
}
