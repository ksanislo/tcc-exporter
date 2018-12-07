FROM python:3.6

EXPOSE 9101

RUN groupadd --gid 5001 tcc-exporter && useradd --no-log-init --no-create-home --home-dir /usr/src/tcc-exporter --uid 5001 --gid 5001 --shell /bin/false tcc-exporter
RUN mkdir -p /usr/src/tcc-exporter && chown tcc-exporter:tcc-exporter /usr/src/tcc-exporter
RUN mkdir -p /var/log/tcc-exporter && chown tcc-exporter:tcc-exporter /var/log/tcc-exporter
WORKDIR /usr/src/tcc-exporter

#RUN apt-get update && apt-get install -y \
#	cron \
#	libarchive13 \
#        lrzip \
#	--no-install-recommends && apt-get autoremove -y && rm -rf /var/lib/apt/lists/* && pip install dumb-init

RUN pip install dumb-init

COPY --chown=tcc-exporter:tcc-exporter . /usr/src/tcc-exporter/

ENV TCC_USERNAME=<username> TCC_PASSWORD=<password> EXPORTER_PORT=9101

ENTRYPOINT ["dumb-init", "--"]
#CMD ["bash", "-c", "cron && su -s /bin/bash -c \"exec pserve production.ini http_port=${TITLEDB_PORT} db_password=${TITLEDB_DBPASSWORD} auth_secret=${TITLEDB_AUTHSECRET}\" tcc-exporter"]
CMD ["python", "./tcc-exporter"]
