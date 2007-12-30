# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
#
# Originally derived from the git eclass
#
# Just set EBZR_REPO_URI to the url of the branch and the src_unpack this
# eclass provides will put an export of the branch in ${WORKDIR}/${PN}.

inherit eutils

EBZR="bzr.eclass"

EXPORT_FUNCTIONS src_unpack

HOMEPAGE="http://bazaar-vcs.org/"
DESCRIPTION="Based on the ${GIT} eclass"

## -- add bzr in DEPEND
#
DEPEND="dev-util/bzr"


## -- EBZR_STORE_DIR:  bzr sources store directory
#
EBZR_STORE_DIR="${PORTAGE_ACTUAL_DISTDIR-${DISTDIR}}/bzr-src"


## -- EBZR_FETCH_CMD:  bzr fetch command
#
EBZR_FETCH_CMD="bzr checkout"

## -- EBZR_UPDATE_CMD:  bzr update command
#
EBZR_UPDATE_CMD="bzr update"

## -- EBZR_DIFFSTAT_CMD: Command to get diffstat output
#
EBZR_DIFFSTAT_CMD="bzr diff"

## -- EBZR_EXPORT_CMD: Command to export branch
#
EBZR_EXPORT_CMD="bzr export"

## -- EBZR_REVNO_CMD: Command to list revision number of branch
#
EBZR_REVNO_CMD="bzr revno"

## -- EBZR_OPTIONS:
#
# the options passed to branch and merge
#
: ${EBZR_OPTIONS:=}


## -- EBZR_REPO_URI:  repository uri
#
# e.g. http://foo, sftp://bar
#
# supported protocols:
#   http://
#   https://
#   sftp://
#   rsync://
#
: ${EBZR_REPO_URI:=}


## -- EBZR_BOOTSTRAP:
#
# bootstrap script or command like autogen.sh or etc..
#
: ${EBZR_BOOTSTRAP:=}


## -- EBZR_PATCHES:
#
# bzr eclass can apply patches in git_bootstrap().
# you can use regexp in this valiable like *.diff or *.patch or etc.
# NOTE: this patches will apply before eval EGIT_BOOTSTRAP.
#
# the process of applying the patch is:
#   1. just epatch it, if the patch exists in the path.
#   2. scan it under FILESDIR and epatch it, if the patch exists in FILESDIR.
#   3. die.
#
: ${EBZR_PATCHES:=}


## -- EBZR_BRANCH:
#
# bzr eclass can fetch any branch in bzr_fetch().
# Defaults to 'trunk'
#
: ${EBZR_BRANCH:=trunk}


## -- EBZR_REVISION:
#
# Revision to get, if not latest (see http://bazaar-vcs.org/BzrRevisionSpec)
#
: ${EBZR_REVISION:=}


## -- EBZR_CACHE_DIR:
#
# The location in which to cache the version, relative to EBZR_STORE_DIR.
#
: ${EBZR_CACHE_DIR:=${PN}}


## -- bzr_fetch() ------------------------------------------------- #

bzr_fetch() {

	local EBZR_BRANCH_DIR

	# EBZR_REPO_URI is empty.
	[[ -z ${EBZR_REPO_URI} ]] && die "${EBZR}: EBZR_REPO_URI is empty."

	# check for the protocol or pull from a local repo.
	if [[ -z ${EBZR_REPO_URI%%:*} ]] ; then
		case ${EBZR_REPO_URI%%:*} in
			http|https|rsync|sftp)
				;;
			*)
				die "${EBZR}: fetch from ${EBZR_REPO_URI%:*} is not yet implemented."
				;;
		esac
	fi

	if [[ ! -d ${EBZR_STORE_DIR} ]] ; then
		debug-print "${FUNCNAME}: initial branch. creating bzr directory"
		addwrite /
		mkdir -p "${EBZR_STORE_DIR}" \
			|| die "${EBZR}: can't mkdir ${EBZR_STORE_DIR}."
		chmod -f o+rw "${EBZR_STORE_DIR}" \
			|| die "${EBZR}: can't chmod ${EBZR_STORE_DIR}."
		export SANDBOX_WRITE="${SANDBOX_WRITE%%:/}"
	fi



	cd -P "${EBZR_STORE_DIR}" || die "${EBZR}: can't chdir to ${EBZR_STORE_DIR}"

	# every time
	addwrite "${EBZR_STORE_DIR}"

	EBZR_BRANCH_DIR="${EBZR_STORE_DIR}/${EBZR_CACHE_DIR}"

	addwrite "${EBZR_BRANCH_DIR}"

	debug-print "${FUNCNAME}: EBZR_OPTIONS = ${EBZR_OPTIONS}"

	if [[ ! -d ${EBZR_BRANCH_DIR} || ${EBZR_REVISION} ]] ; then
		# fetch branch
		einfo "bzr branch start -->"
		einfo "   repository: ${EBZR_REPO_URI}${EBZR_BRANCH}"

		${EBZR_FETCH_CMD} ${EBZR_OPTIONS} "${EBZR_REPO_URI}${EBZR_BRANCH}" ${EBZR_BRANCH_DIR} \
			|| die "${EBZR}: can't branch from ${EBZR_REPO_URI}${EBZR_BRANCH}."

	else
		# update branch
		einfo "bzr merge start -->"
		einfo "   repository: ${EBZR_REPO_URI}${EBZR_BRANCH}"

		cd "${EBZR_BRANCH_DIR}"
		${EBZR_UPDATE_CMD} ${EBZR_OPTIONS} \
			|| die "${EBZR}: can't merge from ${EBZR_REPO_URI}${EBZR_BRANCH}."
		${EBZR_DIFFSTAT_CMD}
	fi

	cd "${EBZR_BRANCH_DIR}"

	einfo "exporting..."
	${EBZR_EXPORT_CMD} ${EBZR_REVISION:+-r ${EBZR_REVISION}} "${WORKDIR}/${P}" \
			|| die "${EBZR}: export failed"

	einfo "Revision ${EBZR_REVNO_COMMAND} is now in ${WORKDIR}/${P}"

	cd "${WORKDIR}"
}


## -- bzr_bootstrap() ------------------------------------------------ #

bzr_bootstrap() {

	local patch lpatch

	cd "${S}"

	if [[ -n ${EBZR_PATCHES} ]] ; then
		einfo "apply patches -->"

		for patch in ${EBZR_PATCHES} ; do
			if [[ -f ${patch} ]] ; then
				epatch ${patch}
			else
				for lpatch in "${FILESDIR}"/${patch} ; do
					if [[ -f ${lpatch} ]] ; then
						epatch ${lpatch}
					else
						die "${EBZR}: ${patch} is not found"
					fi
				done
			fi
		done
		echo
	fi

	if [[ -n ${EBZR_BOOTSTRAP} ]] ; then
		einfo "begin bootstrap -->"

		if [[ -f ${EBZR_BOOTSTRAP} ]] && [[ -x ${EBZR_BOOTSTRAP} ]] ; then
			einfo "   bootstrap with a file: ${EBZR_BOOTSTRAP}"
			eval "./${EBZR_BOOTSTRAP}" \
				|| die "${EBZR}: can't execute EBZR_BOOTSTRAP."
		else
			einfo "   bootstrap with commands: ${EBZR_BOOTSTRAP}"
			eval "${EBZR_BOOTSTRAP}" \
				|| die "${EBZR}: can't eval EBZR_BOOTSTRAP."
		fi
	fi

}


## -- bzr_src_unpack() ------------------------------------------------ #

bzr_src_unpack() {

	bzr_fetch     || die "${EBZR}: unknown problem in bzr_fetch()."
	bzr_bootstrap || die "${EBZR}: unknown problem in bzr_bootstrap()."

}
