const webpack = require('webpack');
const path = require('path');

module.exports = {
    mode: process.env.NODE_ENV,
    optimization: {
        minimize: false
    },
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
                    presets: ['@babel/preset-env']
                }
            }
        ]
    },
    plugins: [],
};
