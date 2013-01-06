# jister

Easily gist an entire project.

## Installing

    gem install jister

### Pulling a jister without installation 

    curl -L http://jister.uxtemple.com | `which bash` -s GIST-ID 

## Commands

This is dead simple. On your project's directory, run:

    jister push
    
or:

    jister pull GIST-ID

To list the available recipes do:

    jister recipes

## Configuration

### JISTER_ROOT

The project's root. Default's to the working directory. To set it, do:

    export JISTER_ROOT='/path/to/jisted/project'

### JISTER_FILES

The files that will be saved to the gist. Defaults to ```['**/*.rb', '**/*.haml', '**/*.rake', '**/*.js', '**/*.css']```. To set it, do:

    export JISTER_FILES='Gemfile,**/*.rb,thisfile.js'

## Using it as a rake task

Copy lib/jister.rake into your app. Make sure you have "jist" installed first.

## Using recipes to rapidly push an entire project 

  To an entire Padrino project:

    jister push --recipe padrino
