# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

NEED_EMACS=22

inherit elisp

DESCRIPTION="A derived Emacs mode implementing most of the C# rules"
HOMEPAGE="http://mfgames.com/linux/csharp-mode"
SRC_URI="http://mfgames.com/linux/releases/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

DEPEND=""

SIMPLE_ELISP=t
SITEFILE=80${PN}-gentoo.el
