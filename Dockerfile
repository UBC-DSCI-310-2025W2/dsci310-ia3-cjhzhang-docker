FROM rocker/rstudio:4.4.2

COPY renv.lock renv.lock
COPY renv/ renv/
