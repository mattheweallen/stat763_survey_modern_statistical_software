#sudo docker build -t shiny/verse:1.0 .
#sudo docker run --rm -d -p 80:3838 \
#    -v /home/matt/repos/stat763_survey_modern_statistical_software/assign3/covid_shiny/:/srv/shiny-server/ \
#    -v /home/matt/repos/stat763_survey_modern_statistical_software/assign3/covid_shiny/shinylog/:/var/log/shiny-server/ \
#    shiny/verse:1.0

FROM rocker/shiny-verse

RUN install2.r --error \
    flexdashboard \
    plotly \
    ggrepel \
    shiny \
    shinythemes