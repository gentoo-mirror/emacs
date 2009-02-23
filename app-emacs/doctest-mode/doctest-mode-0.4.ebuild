# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit elisp

DESCRIPTION="An Emacs major mode for editing Python source"
HOMEPAGE="http://www.cis.upenn.edu/~edloper/projects/doctestmode/"
SRC_URI="http://python-mode.svn.sourceforge.net/viewvc/*checkout*/python-mode/trunk/python-mode/doctest-mode.el?revision=460 -> ${PN}.el"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

SITEFILE=60${PN}-gentoo.el

src_unpack() {
	cp "${DISTDIR}"/${PN}.el "${WORKDIR}"
}