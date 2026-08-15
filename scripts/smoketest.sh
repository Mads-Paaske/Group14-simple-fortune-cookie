#!/usr/bin/env bash
set -eu

# Tester om applikationen svarer. Dette er en tollgate:
# scriptet fejler (exit 1), hvis appen ikke svarer korrekt inden for tidsgrænsen.
# Brug: ./scripts/smoketest.sh <base-url>

base_url="${1%/}"

if ! response=$(curl --fail --silent \
    --connect-timeout 5 --max-time 10 \
    --retry 10 --retry-delay 2 --retry-connrefused \
    "$base_url/healthz"); then
    echo "smoke-test failed: $base_url/healthz" >&2
    exit 1
fi

echo "smoke-test succeded: $base_url/healthz"
exit 0