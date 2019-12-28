#!/bin/bash -x 

chmod -R 777 $PWD

echo docker run -v $PWD/:/tmp/metaRbolomics-book -e RENDER_BOOK_TARGET sneumann/metarbolomics-book-base /tmp/metaRbolomics-book/buildbook.sh >/dev/stdderr
docker run -v $PWD/:/tmp/metaRbolomics-book -e RENDER_BOOK_TARGET sneumann/metarbolomics-book-base /tmp/metaRbolomics-book/buildbook.sh
