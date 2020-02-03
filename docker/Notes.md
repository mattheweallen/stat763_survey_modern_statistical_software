Future
wsl 2
WSL 2 for windows. Full Linux Distribution.
https://www.youtube.com/watch?v=ilKQHAFeQR0

Running desktop
https://www.youtube.com/watch?v=ymV7j003ETA

Current can use docker desktop on Mac or Windows


Or use cloud service.
Free services. Login with uwl account
Azure for students
$100 in Azure Credits
https://portal.azure.com/#home


Repeatable Data Science Workflows.
Quicker on boarding
Get out of the trap: "It works on my machine!"

Develop production ready models from the beginning versus building up technical debt and making the path to deployment difficult and costly.

What is a container?

Container vs VM?

What problem does docker solve?

demo running docker rstudio from azure vm.

devtools install.packages? install.version? for specific versions of R libraries.
devtools can be used even outside of R.

typically can specify version of R in image.

run any linux commands, separate script to install all dependencies.

my profession is software engineer we have things like nuget or maven or others that handle dependencies well

that is something i see lacking in data science tools with R and Python.

I am sure it will change eventually.

requirements.txt. python.



Step 1

Create VM or Install Docker Desktop
You can create Windows or Linux containers.
There are way more Linux images than Windows.

Step 2



ssh key for authentication
https://docs.microsoft.com/en-us/azure/virtual-machines/linux/mac-create-ssh-keys


https://docs.microsoft.com/en-us/azure/virtual-machines/linux/mac-create-ssh-keys


Create VM on Azure
Generate ssh key
ssh-keygen -m PEM -t rsa -b 4096

File saved to
/c/Users/matth/.ssh/id_rsa

Install Docker on VM.
https://docs.docker.com/install/linux/docker-ce/ubuntu/


ssh matt@40.121.12.143


R Markdown slides.

Read what the computer is saying to you!


sudo docker run hello-world


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


Clone repository.


To prepare for this presentation and also start going through the reading setup this environment to do examples from r4ds.

matth@DESKTOP-288LNR7 MINGW64 ~
$ ssh -L 8787:localhost:8787 matt@40.121.12.143



Docker hub
https://hub.docker.com/r/rocker/rstudio/

sudo docker run --rm -d -p 8787:8787 -v $(pwd):/home/rstudio -e PASSWORD=admin rocker/rstudio

rstudio
rstudio

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

https://github.com/rocker-org/rocker/wiki/Using-the-RStudio-image



sudo docker ps -a

Supported by major industry players like Microsoft, Amazon, and Google.