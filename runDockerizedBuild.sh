#!/bin/bash
mkdir public
chmod -R 777 $PWD/public
docker run -v $PWD/public:/tmp/public -e OUTPUT_DIR='"/tmp/public"' -e RENDER_BOOK_TARGET sneumann/metarbolomics-book-base /buildbook.sh
 