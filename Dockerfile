FROM rocker/tidyverse:latest

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
      bzip2 \
      chromium \
      chromium-l10n \
      libgit2-dev \
      texlive-latex-base

ADD install.R /tmp
RUN R -f /tmp/install.R \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

ADD buildbook.sh .
RUN ln -s /usr/bin/chromium /usr/bin/chromium-browser 

