# jister

Easily gist an entire project.

## Why would you want to use this?

Well, let's say somebody submits an issue to that super project you're contributing to.
You do want to fix it but when you read it says: "X doesn't work on my machine".

_Does that sound familiar?_ If it does, welcome **jister**.
With it you can easily upload an entire project to a gist in no time. Sure, you could throw a
tarball somewhere but you will miss the gist's sweetness: forking and comments on your code. Beat that :P

## Installing

    gem install jister

### Pulling a jister without installation 

    curl -L http://jister.uxtemple.com | `which bash` -s GIST-ID
    
### Creating a jist without any gem

A jist is no more than a bunch of files on a gist and way to name them.
If Github provided directories on gists it would be even easier but it doesn't.
So I've just replaced ```/``` on paths for ```_-_```. Try that and the fetch your script with
the pulling instructions above.

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

### JISTER_PUBLIC

Set JISTER_PUBLIC to true if you want to allow public jistering. Defaults to false.

    export JISTER_PUBLIC=true

## Using it as a rake task

Copy lib/jister.rake into your app. Make sure you have "jist" installed first.

## Using recipes to rapidly push an entire project 

  To an entire Padrino project:

    jister push --recipe padrino
