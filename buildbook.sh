#!/bin/bash

git clone --depth 1 https://github.com/rformassspectrometry/metaRbolomics-book.git
cd metaRbolomics-book

if [ -z "$RENDER_BOOK_TARGET" ] ; then 
  RENDER_BOOK_TARGET='c("bookdown::gitbook", "bookdown::pdf_book", "bookdown::epub_book")'
fi 

Rscript -e 'bookdown::render_book("index.Rmd",'$RENDER_BOOK_TARGET')'
