Travis Environment
==================

A repo to reflect on the Travis CI environment.

I'm sure they say these things in their docs, but I've looked for 20 min,
and it seems easier at this point to just make some scripts that print the relevant info.

User
----

`whoami` returns `travis` I don't know that you can rely on this,
seem to recall reading something that said you shouldn't.

Working directory
-----------------

`pwd` returns `/home/travis/build/JoshCheek/travis-environment`,
in this case, that's `/home/travis/build/<GITHUB-USERNAME>/<PROJECT-NAME>`

Environment variables
---------------------

You can see the list of environment variables [here](https://travis-ci.org/JoshCheek/travis-environment/jobs/52596083).
These are the ones that seem interesting to me:

`TRAVIS_RUBY_VERSION` tells you the Ruby version (the question I was attempting to answer)
e.g. `2.2.0`

`PATH` has these directories:

```
/home/travis/.rvm/gems/ruby-2.2.0/bin
/home/travis/.rvm/gems/ruby-2.2.0@global/bin
/home/travis/.rvm/rubies/ruby-2.2.0/bin
/home/travis/.rvm/bin
/home/travis/.gimme/versions/go1.4.1.linux.amd64/bin
/usr/local/phantomjs/bin
/home/travis/.nvm/v0.10.36/bin
./node_modules/.bin
/usr/local/maven-3.2.5/bin
/usr/local/clang-3.4/bin
/home/travis/.gimme/versions/go1.4.1.linux.amd64/bin
/usr/local/phantomjs/bin
./node_modules/.bin
/usr/local/maven-3.2.5/bin
/usr/local/clang-3.4/bin
/home/travis/.gimme/versions/go1.4.1.linux.amd64/bin
/usr/local/phantomjs/bin
./node_modules/.bin
/usr/local/maven-3.2.5/bin
/usr/local/clang-3.4/bin
/usr/local/sbin
/usr/local/bin
/usr/sbin
/usr/bin
/sbin
/bin
```

`TRAVIS_COMMIT` is the git SHA that Travis is running against.

These variables are set to `test`:
* `RACK_ENV`
* `RAILS_ENV`
* `MERB_ENV`

`TRAVIS_OS_NAME` is 'linux'... does Travis support Windows and Mac?!
I thought no, but there's some stuff around that makes it look like I'm wrong,
I'll look into it further when I get to trying to work Traveling Ruby into
[SiB](https://github.com/JoshCheek/seeing_is_believing) editor integration.

`HAS_JOSH_K_SEAL_OF_APPROVAL` is set to `true`,
I assume it's an internal joke (he's one of their cofounders),
but found it in their docs, so I assume they're going to maintain it.

`HAS_ANTARES_THREE_LITTLE_FRONZIES_BADGE` I don't know what this is,
but antares [is a star](http://en.wikipedia.org/wiki/Antares)
and "three little fonzies" seems to be an allusion to
[Pulp Fiction](https://www.youtube.com/watch?v=QPPN_gkj_gk).

`_system_arch` tells you the architecture, eg `x86_64`

`CI` is set to `true`

`TRAVIS_BUILD_ID` tells you the build ID, eg `52596082`
You can use this, for example, to generate the URL to that run, eg
[https://travis-ci.org/JoshCheek/travis-environment/builds/52596082](https://travis-ci.org/JoshCheek/travis-environment/builds/52596082)

`TRAVIS_JOB_ID` tells you the job id, eg `52596083`
You can use this , for example, to generate the URL to that job, eg
[https://travis-ci.org/JoshCheek/travis-environment/jobs/52596083](https://travis-ci.org/JoshCheek/travis-environment/jobs/52596083)

`TRAVIS_BUILD_NUMBER` I assume this is an integer which increments each time the build runs.

`RUBY_VERSION` eg `ruby-1.9.3-p551`, pretty sure this comes from `rvm`.

`TRAVIS_BRANCH` tells you the branch name, eg `master`

`TRAVIS_COMMIT_RANGE` I assume tells you the range from the SHA that it last pulled/ran.
Eg `660d49e2db61...870193e48ada`, you could use this to identify the changes that were
added between the previous successful run, and the current failing run (eg `git log 660d49e2db61...870193e48ada`)
