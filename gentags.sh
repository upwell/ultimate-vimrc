#!/bin/bash

#generate global tag file
which ctags > /dev/null 2>&1

if [ $? -eq 1 ]; then
    echo "ctags is required, install it first."
    exit 1
fi

mkdir -p tags/header
ctags -o ./tags/header/tags -R /usr/include/

[ -d /usr/local/include ] && \
    ctags -o ./tags/header/tags --append=yes \
             -R /usr/local/include/
