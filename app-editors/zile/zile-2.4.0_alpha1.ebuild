# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-editors/zile/zile-2.3.22.ebuild,v 1.1 2011/03/05 18:02:56 ulm Exp $

EAPI=4

MY_P="${P/_}"
DESCRIPTION="Zile is a small Emacs clone"
HOMEPAGE="http://www.gnu.org/software/zile/"
SRC_URI=" ftp://alpha.gnu.org/gnu/zile/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="livecd"
RESTRICT="test"

RDEPEND="=dev-lang/lua-5.1*
	>=dev-lua/luaposix-5.1.9
	>=dev-lua/lcurses-5
	>=dev-lua/luabitop-1.0.1
	>=dev-lua/lrexlib-2.5.3"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"
# FAQ is installed by the build system in /usr/share/zile
DOCS="AUTHORS BUGS NEWS README THANKS"

pkg_postinst() {
	if use livecd; then
		[ -e "${EROOT}"/usr/bin/emacs ] || ln -s zile "${EROOT}"/usr/bin/emacs
	fi
}
