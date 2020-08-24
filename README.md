[![Build Status](https://travis-ci.org/rformassspectrometry/metaRbolomics-book.svg?branch=master)](https://travis-ci.org/rformassspectrometry/metaRbolomics-book)

# The MetaRbolomics book

Repository for the on-line metaRbolomics book at https://rformassspectrometry.github.io/metaRbolomics-book/

Including some active code that is executed upon each build. 

This material, unless excplicitly otherwise stated, is CC-BY 4.0 licenced.

## Docker images

There is a docker image that contains the build environment 
to render the book at https://hub.docker.com/repository/docker/sneumann/metarbolomics-book-base
Output directory and output format are configurable via environment
variables.

Also check:

https://stackoverflow.com/questions/44143110/visualizing-r-function-dependencies

https://cran.r-project.org/web/packages/miniCRAN/vignettes/miniCRAN-dependency-graph.html

https://cran.r-project.org/web/packages/pkgnet/vignettes/pkgnet-intro.html
pkgnet can analyze any R package locally installed. (Run installed.packages() to see the full list of packages installed on your system.)

## Building the book

The `travisScript.sh` uses the Docker image and builds the book in the `build` directory.

Simply run 

```
./travisScript.sh
```

to build the book. 
Output will be saved in the `build/public` directory.

