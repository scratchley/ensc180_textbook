#!/bin/bash
set -e

function run_hook_scripts()
{
  scriptdir="$1"
  shift 1
  if [[ -d $scriptdir ]]
  then
    shopt_nullglob="$(shopt -p nullglob)"
    shopt -s nullglob
    for script_ in "$scriptdir"/*
    do
      if [[ -x $script_ ]]
      then
        "$script_" "$@"
      fi
    done
    $shopt_nullglob
  fi
}

function wait_pids()
{
  for pid in "$@"
  do
    while [[ -e /proc/$pid ]]
    do
      #echo "waiting for $pid"
      sleep 0.5
    done
  done
}

####################### Get PKGBUILDS and related files. #######################
/usr/bin/pbget --aur-only firefox-aurora linux-lqx system76-driver

pids=()

#################### Query trust before starting downloads. ####################
/usr/bin/bb-query_trust -l ./firefox-aurora AUR/firefox-aurora 1475452811 AlexTalker || exit 1
/usr/bin/bb-query_trust -l ./linux-lqx AUR/linux-lqx 1475343571 sir_lucjan || exit 1
/usr/bin/bb-query_trust -l ./system76-driver AUR/system76-driver 1475378335 ava1ar || exit 1

############## Download sources for package base firefox-aurora. ###############
# Maintainer(s): AlexTalker
# Last modified: 2016-10-02 17:00:11 PDT
# Repository: AUR
# Packages: firefox-aurora
pushd firefox-aurora
makepkg --verifysource --nodeps &
pids+=($!)
echo firefox-aurora ": $!"
popd

################# Download sources for package base linux-lqx. #################
# Maintainer(s): sir_lucjan
# Last modified: 2016-10-01 10:39:31 PDT
# Repository: AUR
# Packages: linux-lqx-docs linux-lqx-headers linux-lqx
pushd linux-lqx
makepkg --verifysource --nodeps &
pids+=($!)
echo linux-lqx ": $!"
popd

############## Download sources for package base system76-driver. ##############
# Maintainer(s): ava1ar
# Last modified: 2016-10-01 20:18:55 PDT
# Repository: AUR
# Packages: system76-driver
pushd system76-driver
makepkg --verifysource --nodeps &
pids+=($!)
echo system76-driver ": $!"
popd

############### Wait for downloads and verifications to finish. ################
wait_pids "${pids[@]}"
