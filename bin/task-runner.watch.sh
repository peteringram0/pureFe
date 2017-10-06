#!/bin/bash

# Prevent concurrent watch tasks
LOCK_FILE=/tmp/locked.lock
if [ -f "$LOCK_FILE" ]; then
    echo "Watch already running !!"
    exit 0
fi
trap "rm -f $LOCK_FILE" EXIT
touch $LOCK_FILE

function watch {
    echo "Watching"
    pug --watch src/*.pug --out $OUTPUT &
    stylus ./src/styles/styles.styl --out $OUTPUT -w --include-css &
    webpack --watch --progress --hide-modules --config webpack.config.js $OUTPUT/bundle.js &
    browser-sync start --files $OUTPUT --server $OUTPUT
}

watch
