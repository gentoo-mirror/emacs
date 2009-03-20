# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
WANT_ANT_TASKS="ant-nodeps"
JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2 elisp eutils

DESCRIPTION="Java Development Environment for Emacs"
HOMEPAGE="http://jdee.sourceforge.net/"
SRC_URI="http://dev.gentoo.org/~ulm/distfiles/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=virtual/jdk-1.3
	app-emacs/elib
	>=app-emacs/cedet-1.0_beta3
	dev-java/bsh
	dev-java/junit:0
	dev-util/checkstyle"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"
SITEFILE="70${PN}-gentoo.el"

src_prepare() {
	epatch "${FILESDIR}/${P}-fix-paths-gentoo.patch"
	epatch "${FILESDIR}/${P}-import.patch"

	cd java/lib || die
	java-pkg_jar-from --build-only checkstyle checkstyle.jar checkstyle-all.jar
	java-pkg_jar-from junit
	java-pkg_jar-from bsh
}

src_compile() {
	eant dist \
		-Dcedet.dir="${SITELISP}/cedet" \
		-Delib.dir="${SITELISP}/elib"

	#cd dist/java/lib/ || die
	#rm checkstyle-all.jar
	#java-pkg_jar-from junit
	#java-pkg_jar-from bsh
}

src_install() {
	java-pkg_dojar dist/java/lib/jde.jar

	#jde.jar has direct dependencies on bsh.jar and junit.jar
	#it seems to bundle TestCases inside the jar so junit may
	#not actually be required, or maybe functionality depends
	#on it but code doesn't.
	#checkstyle.jar is needed for jde-checkstyle.el.

	insinto "${JAVA_PKG_SHAREPATH}"
	doins -r java/bsh-commands || die

	use source && java-pkg_dosrc java/src/*
	use doc && java-pkg_dojavadoc dist/doc/java/api

	elisp-install ${PN} dist/lisp/*.{el,elc} || die
	cp "${FILESDIR}/${SITEFILE}" "${T}/" || die
	sed -i -e "s:@PF@:${PF}:" "${T}/${SITEFILE}" || die
	elisp-site-file-install "${T}/${SITEFILE}" || die

	dobin lisp/jtags || die

	dohtml -r dist/doc/html/* || die
	dodoc lisp/readme.txt lisp/ChangeLog lisp/ReleaseNotes.txt
}