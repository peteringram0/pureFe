# pureFe
 
Pure and simple. I want a boilerplate to quickly throw up a static site
using the latest front end tech & techniques. Simple to use & modify plus really really lightweight.

![alt tag](https://media0.giphy.com/media/DgLsbUL7SG3kI/giphy.gif)]

## Features

* ES6
* Stylus (With autoprefixer)
* Pug components
* Simple bash build & watch process (Easy to modify & very fast)
* Long term caching


### Development Watch
````javascript
$ yarn install
$ yarn run watch
````

### Production Build
````javascript
$ yarn install
$ yarn run prod
````

#### Notes
When adding new files to the /assets directory you need to run the following when in development watch mode.
This is not needed when running production builds.

````javascript
$ yarn run assets
```` 
