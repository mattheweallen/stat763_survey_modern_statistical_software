#sudo docker build -t shiny/verse:1.0 .

FROM rocker/shiny-verse:LATEST

RUN install2.r --error \
    flexdashboard \
    plotly \
    ggrepel \
    shiny \
    shinythemes