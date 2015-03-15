# use with docker 1.4.1+ recommended
# railo server jetty 9 java 8

FROM    melinite/jetty_base:latest
MAINTAINER David Seong <melinite@gmail.com>

# As always, define userspace; security is going to be an ongoing issue with popularity of Docker.
# Beware of privilege escalation and do not trust arbitrary docker files blindly.
USER    root

ENV     JETTY_PORT=8080 \
        JETTY_USER=railo \ 
        JETTY_BASE=/opt/railo \
        JETTY_RAILO_CONTEXT=/ \
        JETTY_RAILO_APPNAME=app \
        JAVA_OPTIONS="-server -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -XX:+UseCMSInitiatingOccupancyOnly -XX:CMSInitiatingOccupancyFraction=70 -XX:+ScavengeBeforeFullGC -XX:+CMSScavengeBeforeRemark -Xms512m -Xmx512m -XX:MaxMetaspaceSize=256M"



RUN     mkdir -p ${JETTY_BASE}/lib/railo ${JETTY_BASE}/etc ${JETTY_BASE}/webapps ${JETTY_BASE}/modules   && \
        useradd -rUM -s /bin/false -c "system user jetty" ${JETTY_USER} && \
        chown -RH ${JETTY_USER}:${JETTY_USER} ${JETTY_HOME} ${JETTY_BASE}

# seperate run for efficient caching when jetty user changes frequently.
ADD 	railo-4.2.1.008-jars.tar.gz  ${JETTY_BASE}/lib/railo/

# Had to comment the user privilege out which reduces functionality of host to container mount volumes permissions.
# Uncomment the line below for production use and make sure your ACL is aligned.
# USER    ${JETTY_USER}

COPY    webdefault.xml ${JETTY_BASE}/etc/
COPY    railo.mod ${JETTY_BASE}/modules/

WORKDIR ${JETTY_BASE}
VOLUME ["$JETTY_BASE/webapps"]

RUN     java -jar ${JETTY_HOME}/start.jar --add-to-start=railo

EXPOSE  8080

CMD     exec java ${JAVA_OPTIONS} -jar ${JETTY_HOME}/start.jar -Djetty.railo.context=${JETTY_RAILO_CONTEXT} -Djetty.railo.appname=${JETTY_RAILO_APPNAME} -Djetty.port=${JETTY_PORT} -Djetty.send.server.version=false -Dthreads.min=50