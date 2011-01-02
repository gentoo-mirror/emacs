# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-editors/emacs/emacs-21.4-r22.ebuild,v 1.11 2010/11/14 16:22:09 armin76 Exp $

EAPI=4
WANT_AUTOMAKE="none"

inherit flag-o-matic eutils toolchain-funcs autotools

DESCRIPTION="The extensible, customizable, self-documenting real-time display editor"
HOMEPAGE="http://www.gnu.org/software/emacs/"
SRC_URI="mirror://gnu/emacs/${P}a.tar.gz
	mirror://gentoo/${P}-patches-11.tar.bz2
	leim? ( mirror://gnu/emacs/leim-${PV}.tar.gz )"

LICENSE="GPL-2 FDL-1.1 BSD as-is MIT"
SLOT="21"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x86-fbsd"
IUSE="X Xaw3d leim motif sendmail"

DEPEND="sys-libs/ncurses
	>=app-admin/eselect-emacs-1.2
	X? (
		x11-libs/libXext
		x11-libs/libICE
		x11-libs/libSM
		x11-libs/libXmu
		x11-libs/libXpm
		x11-misc/xbitmaps
		>=media-libs/giflib-4.1.0.1b
		virtual/jpeg
		>=media-libs/tiff-3.5.5-r3
		>=media-libs/libpng-1.2.1
		Xaw3d? ( x11-libs/Xaw3d )
		!Xaw3d? ( motif? ( >=x11-libs/openmotif-2.3:0 ) )
	)"

RDEPEND="${DEPEND}
	>=app-emacs/emacs-common-gentoo-1[X?]
	sendmail? ( virtual/mta )"

src_prepare() {
	EPATCH_SUFFIX=patch epatch

	sed -i \
		-e "s:/usr/lib/crtbegin.o:$(`tc-getCC` -print-file-name=crtbegin.o):g" \
		-e "s:/usr/lib/crtend.o:$(`tc-getCC` -print-file-name=crtend.o):g" \
		"${S}"/src/s/freebsd.h || die "unable to sed freebsd.h settings"

	# This will need to be updated for X-Compilation
	sed -i -e "s:/usr/lib/\([^ ]*\).o:/usr/$(get_libdir)/\1.o:g" \
		"${S}/src/s/gnu-linux.h" || die

	# custom aclocal.m4 was only needed for autoconf 2.13 and earlier
	rm aclocal.m4
	eaclocal
	eautoconf
}

src_configure() {
	# -fstack-protector gets internal compiler error at xterm.c (bug 33265)
	filter-flags -fstack-protector -fstack-protector-all

	# emacs doesn't handle LDFLAGS properly (bug #77430 and bug #65002)
	unset LDFLAGS

	# ever since GCC 3.2
	replace-flags -O[3-9] -O2

	# -march is known to cause signal 6 on some environment
	filter-flags "-march=*"

	local myconf
	if use X ; then
		myconf="${myconf}
			--with-x
			--with-xpm
			--with-jpeg
			--with-tiff
			--with-gif
			--with-png"

		if use Xaw3d ; then
			einfo "Configuring to build with Xaw3d (Athena/Lucid) toolkit"
			myconf="${myconf} --with-x-toolkit=athena"
			use motif \
				&& ewarn "USE flag \"motif\" ignored (superseded by \"Xaw3d\")"
		elif use motif ; then
			einfo "Configuring to build with Motif toolkit"
			myconf="${myconf} --with-x-toolkit=motif"
		else
			# do not build emacs with any toolkit, bug 35300
			einfo "Configuring to build with no toolkit"
			myconf="${myconf} --with-x-toolkit=no"
		fi
	else
		myconf="${myconf} --without-x"
	fi

	econf ${myconf}
}

src_compile() {
	export SANDBOX_ON=0
	emake CC="$(tc-getCC)"

	einfo "Recompiling patched lisp files..."
	(cd lisp; emake recompile)
	(cd src; emake versionclean)
	emake CC="$(tc-getCC)"
}

src_install() {
	local i m

	einstall infodir="${D}/usr/share/info/emacs-${SLOT}"

	for i in "${D}"/usr/bin/* ; do
		mv "${i}" "${i}-emacs-${SLOT}" || die "mv ${i} failed"
	done
	mv "${D}"/usr/bin/emacs{-emacs,}-${SLOT} || die "mv emacs failed"
	rm "${D}"/usr/bin/emacs-${PV}-emacs-${SLOT}

	# move man pages to the correct place
	for m in "${D}"/usr/share/man/man1/* ; do
		mv "${m}" "${m%.1}-emacs-${SLOT}.1" || die "mv ${m} failed"
	done

	# move info dir to avoid collisions with the dir file generated by portage
	mv "${D}"/usr/share/info/emacs-${SLOT}/dir{,.orig} \
		|| die "moving info dir failed"
	touch "${D}"/usr/share/info/emacs-${SLOT}/.keepinfodir
	docompress -x /usr/share/info/emacs-${SLOT}/dir.orig

	# avoid collision between slots
	rm "${D}"/usr/share/emacs/site-lisp/subdirs.el

	# fix permissions
	find "${D}" -perm 664 |xargs chmod -f 644 2>/dev/null
	find "${D}" -type d |xargs chmod -f 755 2>/dev/null

	keepdir /usr/share/emacs/${PV}/leim

	dodoc BUGS ChangeLog README
}

pkg_preinst() {
	# move Info dir file to correct name
	local infodir=/usr/share/info/emacs-${SLOT} f
	if [ -f "${D}"${infodir}/dir.orig ]; then
		mv "${D}"${infodir}/dir{.orig,} || die "moving info dir failed"
	else
		# this should not happen in EAPI 4
		ewarn "Regenerating Info directory index in ${infodir} ..."
		rm -f "${D}"${infodir}/dir{,.*}
		for f in "${D}"${infodir}/*; do
			if [[ ${f##*/} != *[0-9].info* && -e ${f} ]]; then
				install-info --info-dir="${D}"${infodir} "${f}" \
					|| die "install-info failed"
			fi
		done
	fi
}

pkg_postinst() {
	eselect emacs update ifunset

	if ! use sendmail && ! has_version "virtual/mta"; then
		elog "You disabled sendmail support for Emacs. If you later install"
		elog "a MTA then you will need to recompile Emacs. See Bug #11104."
	fi

	if use X; then
		echo
		elog "You need to install some fonts for Emacs."
		elog "Installing media-fonts/font-adobe-{75,100}dpi on the X server's"
		elog "machine would satisfy basic Emacs requirements under X11."
	fi
}

pkg_postrm() {
	eselect emacs update ifunset
}
