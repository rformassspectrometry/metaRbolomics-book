#!/bin/bash

if [ -z "$RENDER_BOOK_TARGET" ] ; then 
  RENDER_BOOK_TARGET='c("bookdown::gitbook", "bookdown::pdf_book", "bookdown::epub_book")'
fi 

cd /tmp/metaRbolomics-book

echo Rscript -e 'bookdown::render_book("index.Rmd",'$RENDER_BOOK_TARGET')' >/dev/stderr
Rscript -e 'bookdown::render_book("index.Rmd",'$RENDER_BOOK_TARGET')'
