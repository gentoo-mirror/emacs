# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="git://git.overlays.gentoo.org/proj/eselect.git"
EGIT_SOURCEDIR="${WORKDIR}/${PN}"

inherit elisp git-2

DESCRIPTION="Gentoo's multi-purpose configuration and management tool"
HOMEPAGE="http://www.gentoo.org/proj/en/eselect/"
SRC_URI=""

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~ppc-aix ~amd64-fbsd ~sparc-fbsd ~x86-fbsd ~x64-freebsd ~x86-freebsd ~hppa-hpux ~ia64-hpux ~x86-interix ~amd64-linux ~arm-linux ~ia64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"

S="${WORKDIR}/${PN}/misc"
SITEFILE="50${PN}-gentoo.el"
