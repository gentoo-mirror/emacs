# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp

DESCRIPTION="Type-ahead support for emacs-w3m"
HOMEPAGE="https://www.emacswiki.org/emacs/WThreeMTypeAhead"
SRC_URI="https://alioth-archive.debian.org/releases/mph-emacs-pkgs/${PN}-el/${PV}/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="app-emacs/emacs-w3m"
DEPEND="${RDEPEND}"

SITEFILE="50${PN}-gentoo.el"
