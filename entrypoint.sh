#!/bin/sh

IOQ3DED_BIN=$(ls /quake3/q3srv*)
if [ $(echo ${IOQ3DED_BIN} | wc -l) -gt 1 ]; then
    echo "Found more than one file matching:"
    echo ${IOQ3DED_BIN}
    exit 1
fi

if [ -z "${ADMIN_PASSWORD}" ]; then
    ADMIN_PASSWORD=quake3
    echo "Set default admin password - '${ADMIN_PASSWORD}'."
fi

if [ -z "${SERVER_ARGS}" ]; then
    echo "Running default ffa configuration."
    SERVER_ARGS="+set fs_game cpma +map cpm1a"
fi

${IOQ3DED_BIN} server \
    +seta rconPassword "${ADMIN_PASSWORD}" \
    ${SERVER_ARGS}