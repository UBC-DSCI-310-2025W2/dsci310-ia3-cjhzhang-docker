FROM rocker/rstudio:4.4.2

WORKDIR /home/rstudio/project

COPY renv.lock /home/rstudio/project/renv.lock
COPY renv/ /home/rstudio/project/renv/

USER root
RUN Rscript -e 'install.packages("renv", repos="https://cran.rstudio.com")' && \
    Rscript -e 'renv::restore(prompt = FALSE)'
    
COPY test_cowsay.R /home/rstudio/project/test_cowsay.R
RUN chown -R rstudio:rstudio /home/rstudio/project

USER rstudio