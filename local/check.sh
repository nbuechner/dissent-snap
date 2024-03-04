#!/usr/bin/env bash
snapctl is-connected password-manager-service
pms=$?

echo "password-manager-service $pms"

if [ "$pms" == "0" ]; then
   exec "${@}"
   exit 0
fi

if [ -f $SNAP_USER_COMMON/.asked-permissions ]; then
   exec "${@}"
   exit 0
fi

xdg-open https://buechner.me/dissent/permissions.html

touch $SNAP_USER_COMMON/.asked-permissions

exec "${@}"
