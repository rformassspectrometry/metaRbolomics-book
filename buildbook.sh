#!/bin/sh

git clone --depth 1 https://github.com/rformassspectrometry/metaRbolomics-book.git
cd metaRbolomics-book
Rscript -e 'bookdown::render_book("index.Rmd", c("bookdown::gitbook", "bookdown::pdf_book", "bookdown::epub_book"))'
