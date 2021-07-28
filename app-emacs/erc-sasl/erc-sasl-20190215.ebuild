# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS=24.5

inherit elisp

COMMIT="0fa60fdf8c2c1cdbe048e5189e35e480fe931c20"
DESCRIPTION="SASL authentication for ERC"
HOMEPAGE="https://gitlab.com/psachin/erc-sasl"
SRC_URI="https://gitlab.com/psachin/${PN}/-/archive/${COMMIT}/${PN}-${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

PATCHES=(
	"${FILESDIR}"/${P}-cl.patch
	"${FILESDIR}"/${P}-byte-compile.patch
	"${FILESDIR}"/${P}-login.patch
)
SITEFILE="50${PN}-gentoo.el"
