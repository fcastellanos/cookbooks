# Cooking with Vagrant, like a Chef.

![cooking-like-a-chef.png](https://github.com/mariozaizar/cookbooks/raw/master/images/cooking-like-a-chef.png)

## Afterwords

Long time ago (almost like a year to be precisely) here in [Crowd][crowd] we traveled to the 2011'[RailsConf][railsconf11] conferences in Baltimore. That week, I took all my credit cards and founds, and replaced my old laptop (switching from Linux to OSX).

So, doing everything on my new laptop was hard. 8 years using linux, makes me confident on my \*nix skills. But those days, I just felt stupid. I wasn't able to do nothing, installing annoying libraries like ImageMagic or even compile Ruby was horrible and painful. 

One day we met [Vagrant][vagrant], and my first thought was:

> Well, this is great! it's like bundler doing my life easier, but for services. It's easy to install, and remove. 
> And I still use Linux!.. and it's virtualized wow!

I started to play with it. I loved the idea of moving all my specific project servers and libs outside my personal OS, and be able to reuse my Linux settings and hacks. Keeping my personal system, clean and stable. No more nasty things like [Mac Ports][macports] to install linux-based services, or any of that shit.

So many things changed since those days. Now, we have Vagrant 1.0, we have a new Ubuntu Precise box (sorry crappy Lucid64), Postgresql 9.1 is more likely now. Now, I'm responsible of all of the recipes from my [new project][billfloat], and we reduced the total new-setup-guide time, from almost a day to just 5 minutes (and it's virtualized remember :D) Doing the same stuff like before, but automatically, and virtualized. Using using Vagrant boxes for Linux, and [Chef-Solo][chef] recipes.

## Why we should care about Chef & Vagrant?

[ ![Video](https://github.com/mariozaizar/cookbooks/raw/master/images/video.png "RailsConf 2012") ](http://youtu.be/5vzNzQzmAk0?hd=1 "Video")
> <http://youtu.be/5vzNzQzmAk0?hd=1>

## *Your first recipe.*

I wrote a blog post about [how to install postgresql on vagrant][postgres] in the past.  
btw, it was really awful (please don't read it). Let's try to fix that:

## Requirements

Go and install: [Vagrant][vagrant] and [Virtualbox][virtualbox].  
Both are free and multi platform, so no excuses.

![virtualbox-vagrant.png](https://github.com/mariozaizar/cookbooks/raw/master/images/virtualbox-vagrant.png)

## The Vagrantfile

Vagrant uses a `Vagrantfile` to configure the box. We suggest to use one Vagrantfile per project. *So don't do nasty things like having all your projects running on the same box. Keep it clean.* At the end, you won't need more than one box running at the time isn't? why install everything on that? doesn't make sense.

```
    # verify the vagrant installation (restart your shell if fails):
    $ vagrant --version
    Vagrant version 1.0.0
    
    # create a new Vagrantfile:
    $ vagrant init;
    …
    # see the current status
    vagrant status;
```

***NOTE:** Remove all the default-comments from the Vagrantfile (feels like the old apache.conf documentation, isn't it's).* Read them if you want, but at the end just leave:

![image](https://github.com/mariozaizar/cookbooks/raw/master/images/vagrantfile.png)

So, it says:

> This box uses a `precise64` template box. If you don't have this template, download it from this `url`. This should use `33.33.33.10` ip address. We want to forward all the comunication from `33.33.33.10:80` to `127.0.0.1:80` (and 5432). Also, we use `Chef-Solo` to provision this box, please include the recipes called `system` and `postgres`. And make it fast! Pronto!

## Vagrant up

Ok, now that we have the Vagrantfile, let's try to start our new virtualized linux, and apply those recipes.

```
    # turn on the machine!
    vagrant up;
    …
    # should said running
    vagrant status;
```

![image](https://github.com/mariozaizar/cookbooks/raw/master/images/chef.png)

> You will see the booting process log. Also (as green/red messages) the Chef-Solo execution. You will be notified if there is any problem starting the box, or applying the recipes. If you see anything in red, you're screwed.

## Vagrant ssh

At this point, you have a new Precise Ubuntu 64bits, ready. And all of our recipes where applied. Let's start a ssh session:

```
    vagrant ssh;
    … 
    # inside the virtual
    uname -a;
    exit;
    …
    # outside the virtual
    vagrant halt;
    … 
    # should said halted (turned off)
    vagrant status;
```

## The Cookbooks folder

Vagrant use [Chef-Solo][chef] to apply the recipes commands inside the virtualized system. Chef use `cookbooks` folder to group similar the recipes by folders, for example the `databases` recipes, the `system` recipes, or whatever.

Each recipe can handle multiple variations, like `databases::mysql` or `databases::postgres`, but it's up to you. We found that sometimes the most simple thing is have just one variation per recipe (the default). Keep it simple. *We suggest to store all the recipes inside the the `/project/cookbooks` folder.*

## The Recipes

![image](https://github.com/mariozaizar/cookbooks/raw/master/images/recipe.png)

> Chef use three basic folders on every recipe, `files`, `recipes`, and `templates`. The recipes is just the commands to be executed, like "apt-get install", "copy", "mkdir" but using Chef syntaxis. The templates are files that can be interpolated, so it could have "variables" and replace values from them. Files are templates without any interpolation. Or whatever other file like images, commands, zip, files.

## Learn how, make tasty things

Easy, just go to the [Opscode Chef-Solo reference][opscode] page.
Take the examples, and try to use them to install your favorite service using Chef-Solo, Vagrant and Virtualbox.

![image](https://github.com/mariozaizar/cookbooks/raw/master/images/opscode.png)

[opscode]: http://wiki.opscode.com/display/chef/Resources
[railsconf11]: http://en.oreilly.com/rails2011
[railsconf12]: http://railsconf.com
[xfree]: http://www.xfree86.org/
[billfloat]: http://billfloat.com
[macports]: http://www.macports.org/
[crowd]: http://crowdint.com
[vagrant]: http://vagrantup.com
[virtualbox]: https://www.virtualbox.org/
[crowd]: http://crowdint.com
[vagrant]: http://vagrantup.com
[postgres]: http://postgresql.org
[chef]: http://wiki.opscode.com/display/chef/Resources
[post]: http://blog.crowdint.com/2011/08/11/postgresql-in-vagrant.html
