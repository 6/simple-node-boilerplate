For quickly hacking together a website that runs on Node.JS.

### install

    git clone https://github.com/6/simple-node-boilerplate.git your_app_name
    cd your_app_name
    ./install

Optionally, if you plan to use github, edit the remote "origin" URL to your git repo in `.git/config`.

### start

`coffee server.coffee` or `foreman start`
    
### components

* CoffeeScript
* ExpressJS for routing
* Jade or EJS for views
* Stylus for CSS
* Bootstrap and jQuery

### heroku
Create a new app

    heroku create your-app-name -s cedar

and push it when you make changes

    git push heroku

### pulling in updates

The `upstream` remote is added when you run `./install`. To pull in upstream changes, run:

    git fetch upstream
    git merge upstream/master
