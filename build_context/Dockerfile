## Get the docker baseline created
FROM coldstrel/bees_app_docker:version1


## Try to use renv lock file for dependencies
#COPY renv.lock /srv/shiny-app/renv.lock
WORKDIR /srv/shiny-app
#RUN R -e "install.packages('renv', repos='https://cloud.r-project.org/'); renv::restore()"

# Copy all project files into the container
COPY . /srv/shiny-app/

# Build the targets pipeline
RUN R -e "library(targets); tar_make()"

# Expose the Shiny app port
EXPOSE 3838

# Set the command to run the Shiny app
CMD ["R", "-e", "shiny::runApp('/srv/shiny-app')"]
