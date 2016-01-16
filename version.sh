#!/bin/sh

[ -z "${VERSION}" ] && VERSION=`git describe --tags --always 2>/dev/null | \
                                fgrep .` \
                    && VERSION=${VERSION#v}

[ -z "${VERSION}" ] && VERSION=`cat VERSION 2>/dev/null`

[ -z "${VERSION}" ] && VERSION=0.0.0

[ "$1" = "major"  ] && printf ${VERSION%%.*} \
                    && exit 0

printf ${VERSION} | tee VERSION
