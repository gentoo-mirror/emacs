# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils multilib

DESCRIPTION="An Emacs clone in Erlang"
HOMEPAGE="http://fresh.homeunix.net/~luke/ermacs/"
# snapshot of jungerl.cvs.sourceforge.net:/cvsroot/jungerl,
# directories: bin, config, lib/ermacs, lib/msc, lib/slang, support
SRC_URI="http://dev.gentoo.org/~ulm/${P}.tar.bz2"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=dev-lang/erlang-11.2.5
	>=sys-libs/slang-1.4.9-r2"
RDEPEND="${DEPEND}"
PROVIDE="virtual/editor"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/${P}-gcc4.patch"
}

src_compile() {
	emake conf || die "emake conf failed"
	cd lib; emake ermacs || die "emake ermacs failed"
}

src_install() {
	local ERL_LIBDIR=/usr/$(get_libdir)/erlang

	cd "${S}/lib"
	for dir in ermacs/ebin ermacs/mods/ebin msc/ebin slang/ebin slang/priv; do
		insinto ${ERL_LIBDIR}/${dir}
		doins -r ${dir}/.
	done

	sed 's/^X//' >"${T}/ermacs" <<-EOF
	#!/bin/sh
	erl -pa ${ERL_LIBDIR}/slang/ebin \\
	X    -pa ${ERL_LIBDIR}/ermacs/ebin \\
	X    -pa ${ERL_LIBDIR}/ermacs/mods/ebin \\
	X    -pa ${ERL_LIBDIR}/msc/ebin \\
	X    -noshell -s edit start \$*
	stty sane
	EOF

	dobin "${T}/ermacs"

	cd "${S}/lib/ermacs"
	dodoc ChangeLog README TODO doc/DESIGN doc/TOUR doc/TROUBLESHOOTING \
		|| die "dodoc failed"
}
