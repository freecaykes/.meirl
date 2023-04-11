#!/bin/sh

git fetch upstream && git checkout $1 && git reset --hard upsteam/$1
