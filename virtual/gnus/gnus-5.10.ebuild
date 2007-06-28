# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/gnus/gnus-0.ebuild,v 1.3 2007/06/05 15:42:11 ulm Exp $

inherit versionator

DESCRIPTION="Virtual for the Gnus newsreader"
HOMEPAGE="http://www.gentoo.org/proj/en/lisp/emacs/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 ppc ~ppc64 sparc ~sparc-fbsd x86 ~x86-fbsd"
IUSE=""

RDEPEND="|| (
		>=app-emacs/gnus-5.10.8
		>=app-emacs/gnus-cvs-5.11
		>=virtual/emacs-22
	)"

DEPEND="${RDEPEND}
	virtual/emacs"

# Are functions allowed in a virtual? PMS (chapters 5 and 13) defines
# virtual packages as follows:
#  "A new-style virtual is a normal package in the virtual category
#   which installs no files and uses its dependency requirements to
#   pull in a 'provider'."

pkg_setup () {
	local gvn=$(emacs -batch -q \
		--eval "(and (require 'gnus nil t) (princ gnus-version-number))")

	if [ "${gvn}" ] && version_is_at_least ${PV} "${gvn}"; then
		einfo "Gnus version ${gvn} detected."
	else
		eerror "virtual/${P} requires at least Gnus version ${PV}."
		eerror "You should either install package app-emacs/{gnus,gnus-cvs},"
		eerror "or use \"eselect emacs\" to select an Emacs version >= 22."
		die "Gnus version ${gvn} is too low."
	fi
}
