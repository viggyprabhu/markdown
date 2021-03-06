#!/usr/bin/env bash

# This requires 1.10+ to support -coverprofile with -coverpkg

set -e

# List of packages to test
pkgs=$(go list ./... | grep -v /vendor)
# list of packages in a format suitable for -coverpkg
cover_pkgs=$(go list ./... | grep -v /vendor | tr "\n" ",")

go test -race -covermode=atomic -coverprofile=coverage.txt -coverpkg ${cover_pkgs} ${pkgs}
