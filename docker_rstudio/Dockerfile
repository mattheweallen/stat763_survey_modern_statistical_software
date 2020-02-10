#https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
#https://stackoverflow.com/questions/45289764/install-r-packages-using-docker-file
#https://docs.docker.com/engine/reference/builder/
#add this as a chart
#docker build .
#ssh -L 8787:localhost:8787 matt@137.117.78.5
#B3Gd
#docker build -t stat763/verse:1.0 .
#https://docs.docker.com/develop/develop-images/baseimages/
#sudo docker run --rm -d -p 8787:8787 -v $(pwd):/home/rstudio -e PASSWORD=admin stat763/verse:1.0
FROM rocker/verse:latest

# Install R packages
# https://github.com/eddelbuettel/littler/blob/master/inst/examples/install2.r
RUN install2.r --error \
    flexdashboard \
    plotly \
    ggrepel 
    #jsonlite \
    #tseries