#!/bin/bash

echo "Moving Assets"

# If its not empty
if [ -e src/assets/* ]; then

    # Remove exiting assets we created
    for d in src/assets/* ; do
        rm -rf $OUTPUT/$(basename "$d")
    done

    # Copy our our assets
    cp -a src/assets/* $OUTPUT

fi
