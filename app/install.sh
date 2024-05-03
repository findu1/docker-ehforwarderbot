#!/usr/bin/env bash

pushd $(dirname "${0}") > /dev/null

APPDIR=$(pwd -L)
VIRTUALENV=".venv"

# create virtual environment
virtualenv --system-site-packages $VIRTUALENV
source $VIRTUALENV/bin/activate
pip3 install -U pip
# install basic packages
pip3 install -r $APPDIR/requirements.txt
# deactivate virtual environment
pip3 uninstall -y pip wheel
deactivate

popd > /dev/null

rm -rf /root/.cache /root/.local
