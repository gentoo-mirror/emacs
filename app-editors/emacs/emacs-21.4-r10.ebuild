# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

WANT_AUTOCONF="2.1"

inherit flag-o-matic eutils toolchain-funcs autotools

DESCRIPTION="An incredibly powerful, extensible text editor"
HOMEPAGE="http://www.gnu.org/software/emacs"
SRC_URI="mirror://gnu/emacs/${P}a.tar.gz
	leim? ( mirror://gnu/emacs/leim-${PV}.tar.gz )"

LICENSE="GPL-2"
SLOT="21"
KEYWORDS="~x86"
IUSE="X Xaw3d leim lesstif motif nls nosendmail"

RDEPEND="sys-libs/ncurses
	X? ( x11-libs/libXext
			x11-libs/libICE
			x11-libs/libSM
			x11-libs/libXmu
			x11-libs/libXpm
			>=media-libs/giflib-4.1.0.1b
			>=media-libs/jpeg-6b-r2
			>=media-libs/tiff-3.5.5-r3
			>=media-libs/libpng-1.2.1
			!arm? (
				Xaw3d? ( x11-libs/Xaw3d )
				!Xaw3d? ( x11-libs/libXaw )
				motif? (
					lesstif? ( x11-libs/lesstif )
				!lesstif? ( >=x11-libs/openmotif-2.1.30 ) )
			)
	)
	nls? ( sys-devel/gettext )
	!nosendmail? ( virtual/mta )
	>=app-admin/eselect-emacs-0.3"

DEPEND="${RDEPEND}
	X? ( x11-misc/xbitmaps )"

PROVIDE="virtual/emacs virtual/editor"

src_unpack() {

	unpack ${A}

	cd "${S}"
	epatch "${FILESDIR}/emacs-21.3-xorg.patch"
	epatch "${FILESDIR}/emacs-21.3-amd64.patch"
	epatch "${FILESDIR}/emacs-21.3-hppa.patch"
	epatch "${FILESDIR}/emacs-21.2-sh.patch"
	epatch "${FILESDIR}/emacs-21.4-libungif-gif-gentoo.patch"

	use ppc64 && epatch "${FILESDIR}/emacs-21.3-ppc64.patch"

	epatch "${FILESDIR}/emacs-21.4-autosave-tmp.patch"
	epatch "${FILESDIR}/emacs-21.4-blessmail-build.patch"
	epatch "${FILESDIR}/emacs-21.4-qa.patch"

	# This will need to be updated for X-Compilation
	sed -i -e "s:/usr/lib/\([^ ]*\).o:/usr/$(get_libdir)/\1.o:g" \
		   "${S}/src/s/gnu-linux.h"
}

src_compile() {
	export SANDBOX_ON=0

	# -fstack-protector gets internal compiler error at xterm.c (bug 33265)
	filter-flags -fstack-protector

	# emacs doesn't handle LDFLAGS properly (bug #77430 and bug #65002)
	unset LDFLAGS

	# ever since GCC 3.2
	replace-flags -O[3-9] -O2

	# this fixes bug 152006
	use ppc64 && append-flags -mno-fp-in-toc -mno-sum-in-toc

	# -march is known to cause signal 6 on some environment
	filter-flags "-march=*"

	eautoconf

	local myconf
	use nls || myconf="${myconf} --disable-nls"
	if use X ; then
		if use motif && use lesstif; then
			append-ldflags -L/usr/X11R6/lib/lesstif -R/usr/X11R6/lib/lesstif
			export CPPFLAGS="${CPPFLAGS} -I/usr/X11R6/include/lesstif"
		fi
		myconf="${myconf}
			--with-x
			--with-xpm
			--with-jpeg
			--with-tiff
			--with-gif
			--with-png"
		if use Xaw3d ; then
			myconf="${myconf} --with-x-toolkit=athena"
		elif use motif ; then
			myconf="${myconf} --with-x-toolkit=motif"
		else
			# do not build emacs with any toolkit, bug 35300
			myconf="${myconf} --with-x-toolkit=no"
		fi
	else
		myconf="${myconf} --without-x"
	fi
	econf ${myconf} || die
	emake CC="$(tc-getCC)" || die

	einfo "Recompiling patched lisp files..."
	(cd lisp; emake recompile) || die
	emake CC="$(tc-getCC)" || die
}

src_install() {
	einstall || die
	for i in "${D}"/usr/bin/* ; do
		mv ${i} ${i}-emacs-${SLOT} || die "mv ${i} failed"
	done
	mv "${D}"/usr/bin/emacs{-emacs,}-${SLOT} || die "mv emacs failed"
	rm "${D}"/usr/bin/emacs-${PV}-emacs-${SLOT}

	einfo "Fixing info documentation..."
	mkdir "${T}/emacs-${SLOT}"
	mv "${D}/usr/share/info/dir" "${T}"
	for i in "${D}"/usr/share/info/*
	do
		mv ${i} "${T}"/emacs-${SLOT}/${i##*/}.info
	done
	mv "${T}/emacs-${SLOT}" "${D}/usr/share/info"
	mv "${T}/dir" "${D}/usr/share/info/emacs-${SLOT}"

	einfo "Fixing manpages..."
	for m in "${D}"/usr/share/man/man1/* ; do
		mv ${m} ${m/.1/-emacs-${SLOT}.1} || die "mv ${m} failed"
	done

	# avoid collision between slots
	rm "${D}"/usr/share/emacs/site-lisp/subdirs.el

	einfo "Fixing permissions..."
	find "${D}" -perm 664 |xargs chmod -f 644 2>/dev/null
	find "${D}" -type d |xargs chmod -f 755 2>/dev/null

	keepdir /usr/share/emacs/${PV}/leim
	keepdir /usr/share/emacs/site-lisp

	dodoc BUGS ChangeLog README
}

pkg_postinst() {
	test -f ${ROOT}/usr/share/emacs/site-lisp/subdirs.el ||
		cp ${ROOT}/usr/share/emacs{/${PV},}/site-lisp/subdirs.el

	eselect emacs update --if-unset

	if use nosendmail; then
		while read line; do einfo "${line}"; done<<'EOF'

You disabled sendmail support for Emacs.  If you later install a MTA
then you will need to recompile Emacs.	See Bug #11104.

EOF
	fi
	if use X; then
		while read line; do einfo "${line}"; done<<'EOF'

You need to install some fonts for Emacs.  Under monolithic
XFree86/Xorg you typically had such fonts installed by default. With
modular Xorg, you will have to perform this step yourself on the machine your
X server is running.

Installing media-fonts/font-adobe-{75,100}dpi would satisfy basic
Emacs requirements under X11.

EOF
	fi
}

pkg_postrm() {
	eselect emacs update --if-unset
}
