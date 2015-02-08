Lucee Server Multi-Context - JETTY 9
=================================

#### Lucee Server + Jetty 9 + Oracle JDK8.

## Usage

You can use this to docker image to deploy a single instance lucee webapp or multi-context webapps.

Mount a writable volume to the location of your app collections. I suggest having a layer of orchestration if you are wanting to use this for prod deploys or dev infrastructure testing. We use SaltStack and it's awesome.

So say you want your dev/production codebase in ***/opt/code/***.



  