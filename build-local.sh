#!/bin/bash

set -euo pipefail

flatpak --user uninstall -y org.sparkleshare.SparkleShare || true
flatpak --user remote-delete sparkleshare-local || true

rm -Rf ./repo

flatpak-builder --force-clean --repo=./repo ./app org.sparkleshare.SparkleShare.local.yml
flatpak --user remote-add --no-gpg-verify sparkleshare-local ./repo
flatpak --user install -y sparkleshare-local org.sparkleshare.SparkleShare
