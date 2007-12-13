#!/bin/bash

# Licensed under GPL version 2
# Authors:
# Christian Faulhammer <opfer@gentoo.org>
# Ulrich Mueller <ulm@gentoo.org>

# Only set colours if output is not redirected
if tty -s <&1; then
    BLUE=$'\e[34;01m'
    GREEN=$'\e[32;01m'
    RED=$'\e[31;01m'
    YELLOW=$'\e[33;01m'
    CYAN=$'\e[36;01m'
    BOLD=$'\e[0;01m'
    NORMAL=$'\e[0m'
fi

SITELISP=/usr/share/emacs/site-lisp
VERSION=0.2
TMPFILE="$(mktemp /tmp/emacs-updater.XXXXXX)"


message() {
    local OUTPUT=$@
    echo "${GREEN}*${NORMAL}${BOLD} ${OUTPUT}${NORMAL}"
}

warning() {
    local OUTPUT=$@
    echo "${YELLOW}*${NORMAL}${BOLD} ${OUTPUT}${NORMAL}"
}

failure() {
    local OUTPUT=$@
    echo "${RED}*${NORMAL}${BOLD} ${OUTPUT}${NORMAL}" 
}

cat <<-EOF

Emacs updater version ${VERSION}
Written by the Gentoo Emacs team http://www.gentoo.org/proj/en/lisp/emacs/
Find packages that are installed in the wrong location

EOF

warning "Note, you must use the eclasses from the Emacs Overlay"
warning "for proper operation!"
echo

if ! [ -x /usr/bin/qfile ]; then
    echo
    failure "Please emerge app-portage/portage-utils to use this tool"
    exit 1
fi

for sf in "${ROOT}${SITELISP}"/[0-9][0-9]*-gentoo.el
do
    [ "${sf##*/}" = 00site-gentoo.el ] && continue
    message "Processing ${sf##*/} ..."
    qfile -qCR "${sf}" >> "${TMPFILE}"
done
echo

if [ ! -s "${TMPFILE}" ]; then
    warning "No packages to update, quitting."
    exit 2
fi

message "Packages with site files in the wrong location:"
cat "${TMPFILE}"

echo
echo -n "${BOLD}Remerge packages?${NORMAL} [${GREEN}Yes${NORMAL}/${RED}No${NORMAL}] "
read choice
echo
case "${choice}" in
     y*|Y*|"")
          ;;
     *)
	warning "Quitting."
	exit 10 ;;
esac

emerge -av $(cat "${TMPFILE}")

warning "If a package is being rebuilt over and over again,"
warning "please report it on http://bugs.gentoo.org/"
