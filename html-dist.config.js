const { script, args, link } = require('html-dist');
const packageJson = require('./package.json');

module.exports = {
    outputFile: packageJson['pureFE.output'] + '/index.html',
    minify: true,
    head: {
        remove: '[href="styles.css"]',
        appends: [
            link({
                rel: "stylesheet",
                type: "text/css",
                href: args.cssFile
            })
        ]
    },
    body: {
        remove: '[src="bundle.js"]',
        appends: [
            script({
                src: args.jsFile
            })
        ]
    }
};
