#!/bin/bash

set -eu

declare -r NAN_HOME='/tmp/nan-toolchain'

if [ -d "${NAN_HOME}" ]; then
	PATH+=":${NAN_HOME}/bin"
	export NAN_HOME \
		PATH
	return 0
fi

declare -r NAN_CROSS_TAG="$(jq --raw-output '.tag_name' <<< "$(curl --retry 10 --retry-delay 3 --silent --url 'https://api.github.com/repos/AmanoTeam/Nan/releases/latest')")"
declare -r NAN_CROSS_TARBALL='/tmp/nan.tar.xz'
declare -r NAN_CROSS_URL="https://github.com/AmanoTeam/Nan/releases/download/${NAN_CROSS_TAG}/x86_64-unknown-linux-gnu.tar.xz"

curl --connect-timeout '10' --retry '15' --retry-all-errors --fail --silent --location --url "${NAN_CROSS_URL}" --output "${NAN_CROSS_TARBALL}"
tar --directory="$(dirname "${NAN_CROSS_TARBALL}")" --extract --file="${NAN_CROSS_TARBALL}"

rm "${NAN_CROSS_TARBALL}"

mv '/tmp/nan' "${NAN_HOME}"

PATH+=":${NAN_HOME}/bin"

export NAN_HOME \
	PATH
