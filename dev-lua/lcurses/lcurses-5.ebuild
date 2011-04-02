# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Lua interface to the curses library"
HOMEPAGE="http://luaforge.net/projects/lcurses/"
SRC_URI="http://luaforge.net/frs/download.php/4810/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-lang/lua-5.1
	sys-libs/ncurses"
DEPEND="${RDEPEND}"

DOCS="README"
