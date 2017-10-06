#!/bin/bash

echo "Building"

# Generate unique id
uuid=$(uuidgen)

# Remove public
rm -rf $OUTPUT

# Development Build
if [ ${NODE_ENV} = "development" ]; then

    echo "Development Build"

    # Webpack
    webpack --progress --hide-modules --config webpack.config.js $OUTPUT/bundle.js

    # Stylus
    stylus ./src/styles/styles.styl --out $OUTPUT --include-css

    # Pug
    pug --out $OUTPUT src/*.pug --pretty

    # Inject scripts and styles into our index.html file
    html-dist --config html-dist.config.js --input $OUTPUT/*.html --jsFile "bundle.js" --cssFile "styles.css"

fi

# Production Build
if [ ${NODE_ENV} = "production" ]; then

    echo "Production Build"

    # Webpack
    webpack --progress --hide-modules --config webpack.config.js "$OUTPUT/app."$uuid".js"

    # Stylus
    stylus ./src/styles/styles.styl -u autoprefixer-stylus --with "{ browsers: 'last 5 versions' }" --out "$OUTPUT/styles".$uuid".css" --compress --include-css

    # Pug
    pug --out $OUTPUT src/*.pug

    # Inject scripts and styles into our index.html file
    html-dist --config html-dist.config.js --input $OUTPUT/*.html --jsFile "app."$uuid".js" --cssFile "styles."$uuid".css"

fi
