Publishing an interactive version of a 'castarter' dataset
==========================================================

This is a Dockerfile based on a fork of [Rocker-Shiny](https://github.com/rocker-org/shiny). All information from the original readme are available at the bottom of this page.

The Dockerfile has been changed to introduce install of packages required for `castarter`. 

The folder "EuropeanParliament" serves as a template for quickly creating docker images to publish shinyApps of own datasets. 

You can download/clone it, copy the app created by castarter's CreateShinyApp into the myApp folder (erasing any previous contents of myApp), and you are ready to go: you can build your Docker image, upload it to Docker Hub and deploy it immediately. 

From within the EuropeanParliament folder (change 'EuropeanParliament' to whatever your project name, and place your username instead of 'giocomai'), run:

```sh
sudo docker build -t giocomai/EuropeanParliament .
```

Consider enabling the `--no-cache` flag, to make sure that `castarter` embedded in the docker image is its latest version.

```sh
sudo docker build -t --no-cache=true giocomai/EuropeanParliament .
```

You can then run then push the image to Docker Hun with:

```sh
sudo docker push giocomai/EuropeanParliament .
```

Or run it with:

```sh
sudo docker run giocomai/EuropeanParliament
```

If you wish to run it locally, consider publishing it on a separate port:

```sh
sudo docker run -p 8787:8787 giocomai/EuropeanParliament
```

Original README from rocker-shiny
=================================

This is a Dockerfile for Shiny Server on Debian "testing". It is based on the r-base image.

The image is available from [Docker Hub](https://registry.hub.docker.com/u/rocker/shiny/).

## Usage:

To run a temporary container with Shiny Server:

```sh
docker run --rm -p 3838:3838 rocker/shiny
```


To expose a directory on the host to the container use `-v <host_dir>:<container_dir>`. The following command will use one `/srv/shinyapps` as the Shiny app directory and `/srv/shinylog` as the directory for logs. Note that if the directories on the host don't already exist, they will be created automatically.:

```sh
docker run --rm -p 3838:3838 \
    -v /srv/shinyapps/:/srv/shiny-server/ \
    -v /srv/shinylog/:/var/log/ \
    rocker/shiny
```

If you have an app in /srv/shinyapps/appdir, you can run the app by visiting http://localhost:3838/appdir/. (If using boot2docker, visit http://192.168.59.103:3838/appdir/)


In a real deployment scenario, you will probably want to run the container in detached mode (`-d`) and listening on the host's port 80 (`-p 80:3838`):

```sh
docker run -d -p 80:3838 \
    -v /srv/shinyapps/:/srv/shiny-server/ \
    -v /srv/shinylog/:/var/log/ \
    rocker/shiny
```


## Trademarks

Shiny and Shiny Server are registered trademarks of RStudio, Inc. The use of the trademarked terms Shiny and Shiny Server and the distribution of the Shiny Server through the images hosted on hub.docker.com has been granted by explicit permission of RStudio. Please review RStudio's trademark use policy and address inquiries about further distribution or other questions to permissions@rstudio.com.
