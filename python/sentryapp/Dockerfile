# use with docker 1.4.1+ recommended
# sentry from very lightweight google/debian:wheezy

FROM   melinite/min_python:2.7
MAINTAINER David Seong <melinite@gmail.com>

RUN 	mkdir -p /conf /data /wheels

COPY 	requirements.txt /conf/
COPY	sentry_docker_conf.py /conf/
COPY	sentry_run /usr/local/bin/
COPY	scripts/create_team_or_project.py /conf/

RUN 	pip install -U wheel 
RUN 	pip wheel --wheel-dir=/wheels -r /conf/requirements.txt && pip install --find-links=/wheels -r /conf/requirements.txt


VOLUME ["/data"]

EXPOSE 9000
ENTRYPOINT ["/usr/local/bin/sentry_run"]

CMD ["start"]
