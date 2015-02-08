Jetty 9 on Oracle JDK8 for Docker
=================================
#### Use as a base image to build on top of jetty. 
If you use this as a base image, I HIGHLY recommend to use JETTY_BASE directive in your new dockerfile to keep your customizations separate from the binary distro. Makes for very easy jetty upgrades without touching your app and customizations. +1^.^ to jetty team for modules and base!
 http://www.eclipse.org/jetty/documentation/current/startup-base-and-home.html


