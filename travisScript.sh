#!/bin/bash

chmod -R 777 $PWD
docker run -v $PWD/:/tmp/metaRbolomics-book -e RENDER_BOOK_TARGET sneumann/metarbolomics-book-base /tmp/metaRbolomics-book/buildbook.sh
