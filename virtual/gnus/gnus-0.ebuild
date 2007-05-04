# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Virtual for the Gnus newsreader"
HOMEPAGE="http://www.gentoo.org/proj/en/lisp/emacs/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 ppc ~ppc64 sparc x86"
IUSE=""

DEPEND=""
RDEPEND="|| (
	>=app-emacs/gnus-5.10.8
	>=app-emacs/gnus-cvs-5.11
	>=virtual/emacs-22
	)"
