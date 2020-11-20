FROM rocker/tidyverse

## installing R pckg needed for analysis
RUN Rscript -e "install.packages('tidyverse')"

## make a project directory in the container
## we will mount our local project directory to this directory
RUN mkdir /project

## copy contents of my local folder to project folder in container
COPY ./ /project/

## make R scripts executable
RUN chmod +x /project/R/*.R

## make container entry point
CMD make -C project report.html
