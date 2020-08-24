#!/bin/bash -x 

mkdir build/
cp -R . build/
chmod -R 777 build/
docker run -v $PWD/build/:/tmp/metaRbolomics-book -e RENDER_BOOK_TARGET sneumann/metarbolomics-book-base /tmp/metaRbolomics-book/buildbook.sh
