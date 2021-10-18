#!/bin/bash
set -e

function log() {
    echo $1 `date`
}

log "Installing Tuist ..."
curl -Ls https://install.tuist.io | bash

if ${dependencies_fetch}
then
    log "Fetching dependencies ..."
    tuist dependencies fetch
fi

if ${cache_warm}
then
    log "Warming the cache ..."
    tuist cache warm
fi

log "Generating the Xcode files ..."
tuist generate
