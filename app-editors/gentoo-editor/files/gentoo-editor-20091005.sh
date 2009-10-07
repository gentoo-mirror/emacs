#!/bin/sh

if [ -z "${EDITOR}" ]; then
    # Try to get EDITOR from system profile
    EDITOR=$(source /etc/profile &>/dev/null; echo "${EDITOR}")
fi

if [ -z "${EDITOR}" ]; then
    echo "The EDITOR variable must be set." >&2
    exit 1
fi

exec ${EDITOR} "$@"
