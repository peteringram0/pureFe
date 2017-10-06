const webpack = require('webpack');
const path = require('path');
const UglifyJSPlugin = require('uglifyjs-webpack-plugin');

module.exports = {
    entry: {
        app: path.resolve(__dirname, './src/javascript/bundle.js')
    },
    module: {
        rules: [
            {
                test: /\.js$/,
                loader: 'babel-loader',
                exclude: /node_modules/,
                query: {
                    presets: ['es2015', 'stage-0']
                }
            }
        ]
    },
    plugins: [],
};

/**
 * Producton mode
 */
if (process.env.NODE_ENV === "production") {
    module.exports.plugins.push(

        // Uglify
        new UglifyJSPlugin()

    )
}
