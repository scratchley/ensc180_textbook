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

########################### Build package linux-lqx ############################
# Maintainer(s): sir_lucjan
# Last modified: 2016-10-01 10:39:31 PDT
# Repository: AUR
# Package Base: linux-lqx
pushd linux-lqx
/usr/bin/bb-query_trust -l . AUR/linux-lqx 1475343571 sir_lucjan || exit 1
makepkgx -irs --pconfig /etc/pacman.conf --pkg linux-lqx
pacman --config /etc/pacman.conf -T linux-lqx || exit 1
popd

######################## Build package system76-driver #########################
# Maintainer(s): ava1ar
# Last modified: 2016-10-01 20:18:55 PDT
# Repository: AUR
# Package Base: system76-driver
pushd system76-driver
/usr/bin/bb-query_trust -l . AUR/system76-driver 1475378335 ava1ar || exit 1
makepkgx -irs --pconfig /etc/pacman.conf --pkg system76-driver
pacman --config /etc/pacman.conf -T system76-driver || exit 1
popd

####################### Build package linux-lqx-headers ########################
# Maintainer(s): sir_lucjan
# Last modified: 2016-10-01 10:39:31 PDT
# Repository: AUR
# Package Base: linux-lqx
pushd linux-lqx
/usr/bin/bb-query_trust -l . AUR/linux-lqx 1475343571 sir_lucjan || exit 1
makepkgx -irs --pconfig /etc/pacman.conf --pkg linux-lqx-headers
pacman --config /etc/pacman.conf -T linux-lqx-headers || exit 1
popd

######################### Build package linux-lqx-docs #########################
# Maintainer(s): sir_lucjan
# Last modified: 2016-10-01 10:39:31 PDT
# Repository: AUR
# Package Base: linux-lqx
pushd linux-lqx
/usr/bin/bb-query_trust -l . AUR/linux-lqx 1475343571 sir_lucjan || exit 1
makepkgx -irs --pconfig /etc/pacman.conf --pkg linux-lqx-docs
pacman --config /etc/pacman.conf -T linux-lqx-docs || exit 1
popd

######################### Build package firefox-aurora #########################
# Maintainer(s): AlexTalker
# Last modified: 2016-10-02 17:00:11 PDT
# Repository: AUR
# Package Base: firefox-aurora
pushd firefox-aurora
/usr/bin/bb-query_trust -l . AUR/firefox-aurora 1475452811 AlexTalker || exit 1
makepkgx -irs --pconfig /etc/pacman.conf --pkg firefox-aurora
pacman --config /etc/pacman.conf -T firefox-aurora || exit 1
popd
