#!/usr/bin/env bash

# Use to update workspace and all submodule 

git pull
git submodule init
git submodule update
git submodule foreach git checkout master
git submodule foreach git pull
