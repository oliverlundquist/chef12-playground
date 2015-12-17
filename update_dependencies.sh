#!/bin/bash

# 1. jump to directory where this file is placed
cd ${0%/*}

# 2. update cookbook dependencies
berks vendor ./vendor

# 3. remove old cookbooks
find ./vendor/* -type d -depth 0 -exec basename {} \; | xargs -I '{}' rm -rf ./'{}'

# 4. copy new cookbooks
find ./vendor/* -type d -depth 0 -exec basename {} \; | xargs -I '{}' cp -r ./vendor/'{}' ./

# 5. remove vendor dir
rm -rf vendor
