Lucee Server Multi-Context - JETTY 9
=================================

#### Lucee Server + Jetty 9 + Oracle JDK8.

## Usage

You can use this to docker image to deploy a single instance lucee webapp or multi-context webapps.

Mount a writable volume to the location of your app collections. I suggest having a layer of orchestration if you are wanting to use this for prod deploys or dev infrastructure testing. We use SaltStack and it's awesome.

## Quick Use
```bash
# initialize working codebase and create context and app folder
# git pull my sample with lucee skel
mkdir -p /opt/code/luceeApps && cd /opt/code/luceeApps && \
curl -L https://github.com/melinite/docker-pub/raw/master/lucee/lucee_jetty9/deploy/luceeSampleWebapp.tar.xz | tar -xJf - && \
docker pull melinite/lucee:jetty9 && \
docker run -d -P -v /opt/code/luceeApps:/opt/lucee/webapps melinite/lucee:jetty9 && \
docker ps
```
The last command was to view the auto assigned port from Docker. you can also do -p 8888:8080 to manually assign. 

#### Note: please look at the luceeimhome.xml jetty context descriptor. Make sure you have created the resourceBase folders. War deploys are possible to. 

## DockerFile Environment Configuration
I've exposed a few standard settings such has jvm options and port in the dockerfile.










  
