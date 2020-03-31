#https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
#https://stackoverflow.com/questions/45289764/install-r-packages-using-docker-file
#https://docs.docker.com/engine/reference/builder/
#add this as a chart
#docker build .
#ssh -L 8787:localhost:8787 matt@168.61.46.26
#B3Gd
#docker build -t stat763/verse:1.0 .
#https://docs.docker.com/develop/develop-images/baseimages/

#start from root of directory so the .rstudio file is put there and ignored by git
#sudo docker run --rm -d -p 8787:8787 -v $(pwd):/home/rstudio -e PASSWORD=admin stat763/verse:1.0
FROM rocker/verse:latest

#https://github.com/aabor/rstudio/blob/master/rstudio-text/Dockerfile
# install poppler, some dependencies of other R packages
RUN apt-get update && apt-get install -y \
    ## poppler to install pdftools to work with .pdf files
    libpoppler-cpp-dev \
    ## system dependency of hunspell (devtools)
    libhunspell-dev \
    ## system dependency of hadley/pkgdown
    libmagick++-dev \
    ## (GSL math library dependencies)
    # for topicmodels on which depends textmineR
    gsl-bin \
    libgsl0-dev \
    librdf0-dev \
    && apt-get clean

# Adobe Acrobat pdf files
RUN install2.r --error \ 
    # Text Extraction, Rendering and Converting of PDF Documents. Utilities based on 'libpoppler' for extracting text,
    # fonts, attachments and metadata from a PDF file. Also supports high quality rendering of PDF documents info PNG,
    # JPEG, TIFF format, or into raw bitmap vectors
    pdftools \
    && rm -rf /tmp/downloaded_packages/

# Install R packages
# https://github.com/eddelbuettel/littler/blob/master/inst/examples/install2.r
RUN install2.r --error \
    flexdashboard \
    plotly \
    ggrepel \
    shiny \
    shinythemes

    #pdftools
    #jsonlite \
    #tseries
