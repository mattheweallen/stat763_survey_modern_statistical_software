```
ssh -L 8787:localhost:8787 matt@40.121.12.143
```

```
sudo docker run --rm -d -p 8787:8787 -v $(pwd):/home/rstudio -e PASSWORD=admin rocker/verse
```

https://docs.docker.com/engine/reference/commandline/ps/
```
sudo docker ps -a 
```

```
sudo docker stop e7e2f2874279
```

```
matt@docker-demo-vm:~$ sudo docker run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
1b930d010525: Pull complete
Digest: sha256:9572f7cdcee8591948c2963463447a53466950b3fc15a247fcad1917ca215a2f
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```

```
matt@docker-demo-vm:~/repos/stat763_survey_modern_statistical_software$ sudo docker run -d -p 8787:8787 -v $(pwd):/home/rstudio -e PASSWORD=rstudio rocker/rstudio
Unable to find image 'rocker/rstudio:latest' locally
latest: Pulling from rocker/rstudio
8f0fdd3eaac0: Pull complete
c42f03650681: Pull complete
e8d8a2a587cb: Pull complete
8070157c9f99: Pull complete
0a7a0529ec26: Pull complete
8781e7725be3: Pull complete
dfd244768473: Pull complete
Digest: sha256:a4197e99330a6c3065649cfd6c01231cbd3f10beba4fb507bfbecc25dec2db44
Status: Downloaded newer image for rocker/rstudio:latest
aacf888a713275f85c94ab7e0548af9c841f865c067d8e5c13560e7e0031c7fc
```

```
matt@docker-demo-vm:~$ sudo docker ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                  PORTS               NAMES
c49c91e4149b        hello-world         "/hello"            2 days ago          Exited (0) 2 days ago                       trusting_jang
matt@docker-demo-vm:~$ sudo docker run --rm -d -p 8787:8787 -v $(pwd):/home/rstudio -e PASSWORD=admin rocker/verse
Unable to find image 'rocker/verse:latest' locally
latest: Pulling from rocker/verse
8f0fdd3eaac0: Already exists
c42f03650681: Already exists
e8d8a2a587cb: Already exists
8070157c9f99: Already exists
0a7a0529ec26: Already exists
8781e7725be3: Already exists
dfd244768473: Already exists
0346eddd3dca: Pull complete
444d6a84b975: Pull complete
Digest: sha256:ce9e3c004bb2b0d6b5ca6235645b57d540d6012b7e3f5635d0c632c0ebae85af
Status: Downloaded newer image for rocker/verse:latest
e7e2f287427952d145f89c8a2d9c3516ba391e02c5fce51c448e495f5431177f
```

https://github.com/rocker-org/rocker/wiki/Using-the-RStudio-image

```
```