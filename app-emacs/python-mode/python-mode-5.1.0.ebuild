# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emacs/python-mode/python-mode-1.0-r1.ebuild,v 1.7 2008/09/20 17:59:06 vapier Exp $

inherit elisp

DESCRIPTION="An Emacs major mode for editing Python source"
HOMEPAGE="https://launchpad.net/python-mode"
SRC_URI="http://launchpad.net/python-mode/trunk/5.1.0/+download/python-mode.el"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE="pymacs"

DEPEND=""
RDEPEND="${DEPEND}"

SITEFILE=61${PN}-gentoo.el

src_unpack() {
	cp "${DISTDIR}"/${PN}.el "${WORKDIR}"
}
