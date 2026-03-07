#!/bin/bash
# Sync the haos-addon and package source to the HA Supervisor local addons directory

ADDON_DIR="/mnt/data/supervisor/addons/local/velbustcp"
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Syncing addon files to ${ADDON_DIR}..."

mkdir -p "${ADDON_DIR}"

# Copy addon files
cp "${REPO_DIR}/haos-addon/Dockerfile" "${ADDON_DIR}/"
cp "${REPO_DIR}/haos-addon/config.yaml" "${ADDON_DIR}/"
cp "${REPO_DIR}/haos-addon/build.yaml" "${ADDON_DIR}/"
cp "${REPO_DIR}/haos-addon/run.sh" "${ADDON_DIR}/"

# Copy package source (needed for local Dockerfile build)
cp "${REPO_DIR}/setup.cfg" "${ADDON_DIR}/"
cp "${REPO_DIR}/setup.py" "${ADDON_DIR}/"
cp "${REPO_DIR}/pyproject.toml" "${ADDON_DIR}/"
rm -rf "${ADDON_DIR}/src"
cp -r "${REPO_DIR}/src" "${ADDON_DIR}/"

echo "Done. Now run: ha addons build local_velbustcp"
