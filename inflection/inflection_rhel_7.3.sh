# ----------------------------------------------------------------------------
#
# Package       : inflection
# Version       : 0.3.1
# Source repo   : https://github.com/jpvanhal/inflection
# Tested on     : Rhel_7.3
# Script License: Apache License, Version 2 or later
# Maintainer    : Archa Bhandare <barcha@us.ibm.com>
#
# Disclaimer: This script has been tested in non-root mode on given
# ==========  platform using the mentioned version of the package.
#             It may not work as expected with newer versions of the
#             package and/or distribution. In such case, please
#             contact "Maintainer" of this script.
#
# ----------------------------------------------------------------------------

#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

## Update source
sudo yum update -y

## Install dependencies
sudo yum groupinstall -y "Development Tools"
sudo yum install -y python git gcc-c++ python-devel.ppc64le python-setuptools python-virtualenv python-test python-pyudev.noarch
sudo easy_install pip && sudo pip install --upgrade setuptools virtualenv mock ipython_genutils pytest traitlets

## Clone repo
git clone https://github.com/jpvanhal/inflection

## Build, Install and Test
cd inflection/
sudo pip install -r requirements.txt && sudo flake8 . && sudo isort --recursive --diff . && sudo isort --recursive --check-only . && sudo py.test