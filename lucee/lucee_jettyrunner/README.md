Lucee Ricky Express Edition
=================================
#### Lucee + Jetty 9 runner + YOUR JVM
Lucee Ricky Express Edition aims to be a dead simple way to experience Lucee.

![](http://upload.wikimedia.org/wikipedia/en/4/44/ILoveLucyTitleScreen.jpg)

Usage
===
Extremely simple.
Download release packages.

[Windows zip download link](https://github.com/melinite/docker-pub/raw/master/lucee/lucee_jettyrunner/release/lucee_jettyrunner_4.5.1.000_filebufferpatch.zip "windows zip")

[Linux tar download link](https://github.com/melinite/docker-pub/raw/master/lucee/lucee_jettyrunner/release/lucee_jettyrunner_4.5.1.000_filebufferpatch.tar.xz "linux tar")


Uncompress.

	Run lucee_start.sh or lucee_start.bat
****
#### WINDOWS USERS NOTE REGARDING FILE LOCKING

http://www.eclipse.org/jetty/documentation/current/troubleshooting-locked-files-on-windows.html

	--disablefilebuffer option added to batch file by default
Thanks AJ MERCER
Lucee discussion link: https://groups.google.com/forum/#!topic/lucee/Pj70NfcKgZ4






## Where do I place my code?
After starting up there should be a **work** folder with a long ass name. Check the webapp folder inside.

Something like

	/opt/code/LuceeRickyExpress/work/**jetty-0.0.0.0-8080-lucee-4.5.1.000.war-_lucee-any-5090175272883114169.dir**/webapp

## Config
Look inside each startup file. For some basic configuration

BAT for windows and sh for linux environments.

## Naked Run
    java -jar jetty-runner.jar lucee-4.5.1.000.war

**!! Warning the above explodes the war in to your system temp and destroys the webapp upon exiting !!**

## Options
	Usage: java [-Djetty.home=dir] -jar jetty-runner.jar [--help|--version] [ server opts] [[ context opts] context ...]
	Server opts:
	--version                           - display version and exit
	--log file                          - request log filename (with optional 'yyyy_mm_dd' wildcard
	--out file                          - info/warn/debug log filename (with optional 'yyyy_mm_dd' wildcard
	--host name|ip                      - interface to listen on (default is all interfaces)
	--port n                            - port to listen on (default 8080)
	--stop-port n                       - port to listen for stop command
	--stop-key n                        - security string for stop command (required if --stop-port is present)
	--disablefilebuffer                 - disables jetty memory mapping a file (windows causes locking) only for war deployments
	[--jar file]*n                      - each tuple specifies an extra jar to be added to the classloader
	[--lib dir]*n                       - each tuple specifies an extra directory of jars to be added to the classloader
	[--classes dir]*n                   - each tuple specifies an extra directory of classes to be added to the classloader
	--stats [unsecure|realm.properties] - enable stats gathering servlet context
	[--config file]*n                   - each tuple specifies the name of a jetty xml config file to apply (in the order defined)
	Context opts:
	[[--path /path] context]*n          - WAR file, web app dir or context xml file, optionally with a context path



## Stats
Local servlet stats available here if you run the lucee_start scripts

	http://localhost:8080/_jettystats

Outputs

	Statistics:

	Statistics gathering started 18680ms ago
	Requests:

	Total requests: 17
	Active requests: 1
	Max active requests: 1
	Total requests time: 26
	Mean request time: 1.625
	Max request time: 7
	Request time standard deviation: 1.4580809305384939
	Dispatches:

	Total dispatched: 17
	Active dispatched: 1
	Max active dispatched: 1
	Total dispatched time: 26
	Mean dispatched time: 1.625
	Max dispatched time: 7
	Dispatched time standard deviation: 1.4580809305384939
	Total requests suspended: 0
	Total requests expired: 0
	Total requests resumed: 0
	Responses:

	1xx responses: 0
	2xx responses: 15
	3xx responses: 1
	4xx responses: 0
	5xx responses: 0
	Bytes sent total: 20707
	Connections:

	org.eclipse.jetty.server.ServerConnector@1896305732

	Protocols:http/1.1  
	Statistics gathering started 18573ms ago
	Total connections: 1
	Current connections open: 1
	Max concurrent connections open: 1
	Mean connection duration: NaN
	Max connection duration: 0
	Connection duration standard deviation: 0.0
	Total messages in: 0
	Total messages out: 0
	Memory:

	Heap memory usage: 60586224 bytes
	Non-heap memory usage: 31304832 bytes



 Tips
 ===
#### Can I run this in production?

I don't recommend it as there is a lot of production application lifecycle directives not configured. But I'm sure it will run fine but it will take some more effort on your behalf.



#### How can I add more configuration?
[http://www.eclipse.org/jetty/documentation/current/runner.html "jetty runner doc")
