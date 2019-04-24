#!/bin/bash

set -euo pipefail

rm -Rf ./repo
flatpak-builder --force-clean --repo=./repo ./app org.sparkleshare.SparkleShare.local.yml
flatpak --user uninstall -y org.sparkleshare.SparkleShare; flatpak --user remote-delete sparkleshare-local
flatpak --user remote-add --no-gpg-verify sparkleshare-local ./repo
flatpak --user install -y sparkleshare-local org.sparkleshare.SparkleShare
