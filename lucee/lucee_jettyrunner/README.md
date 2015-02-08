Lucee Ricky Express Edition
=================================
#### Lucee + Jetty 9 runner + YOUR JVM
Lucee Ricky Express Edition aims to be a dead simple way to experience Lucee. 

## Usage
Extremely simple. 
Download release packages.
Uncompress. 

Run **lucee\_start.sh** or **lucee\_start.bat**


## Where do I place my code?
After starting up there should be a **work** folder with a long ass name. Check the webapp folder inside.

Something like
	
> /opt/code/LuceeRickyExpress/work/**jetty-0.0.0.0-8080-lucee-4.5.1.000.war-_lucee-any-5090175272883114169.dir**/webapp

## Config
Look inside each startup file. For some basic configuration

BAT for windows and sh for linux environments.

## Downloads
Windows zip

Linux tar

## Naked Run
    java -jar jetty-runner.jar lucee-4.5.1.000.war

**!! Warning the above explodes the war in to your system temp and destroys the webapp upon exiting !!**

## Tips
#### Can I run this in production?

I don't recommend it as there is a lot of production application lifecycle directives not configured. But I'm sure it will run fine but it will take some more effort on your behalf.

#### How can I add more configuration?
[http://www.eclipse.org/jetty/documentation/9.2.2.v20140723/runner.html](http://www.eclipse.org/jetty/documentation/9.2.2.v20140723/runner.html "jetty runner doc")



