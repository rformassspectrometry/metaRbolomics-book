FROM rocker/tidyverse:latest

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
      bzip2 \
      chromium chromium-l10n \
      libgit2-dev \
      texlive-latex-base texlive-xetex texlive-latex-extra texlive-fonts-recommended lmodern

ADD install.R /tmp
RUN R -f /tmp/install.R \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

ENV CHROMOTE_CHROME /usr/bin/chromium

ADD buildbook.sh .

RUN groupadd -r mygrp && useradd -r -g mygrp myuser 
USER myuser
WORKDIR /tmp

