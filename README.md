# jister

Easily gist a whole project.

## Installing

    gem install jister

### Pulling a jister without installation 

    curl -L http://jister.uxtemple.com | `which bash` -s GIST-ID 

## Commands

jister push

Will push a 

jister pull GIST-ID

## Configuration

### JISTER_ROOT

The project's root. Default's to the working directory. To set it, do:

    export JISTER_ROOT='/path/to/jisted/project'

### JISTER_FILES

The files that will be saved to the gist. Defaults to ```['**/*.rb', '**/*.haml', '**/*.rake', '**/*.js', '**/*.css']```. To set it, do:

    export JISTER_FILES='Gemfile,**/*.rb,thisfile.js'

## Using it as a rake task

    Copy lib/jister.rake into your app. Make sure you have "jist" installed first.

## Creating a new Padrino project from a gist

    padrino g project some_project; cd some_project; jister pull GIST-ID

or

    padrino g project some_project; cd some_project; curl -L http://jister.uxtemple.com | `which bash` -s GIST-ID
