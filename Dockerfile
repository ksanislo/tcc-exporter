FROM python:3.7
RUN groupadd --gid 5001 tcc-exporter && useradd --no-log-init --no-create-home --home-dir /usr/src/tcc-exporter --uid 5001 --gid 5001 --shell /bin/false tcc-exporter
RUN mkdir -p /usr/src/tcc-exporter && chown tcc-exporter:tcc-exporter /usr/src/tcc-exporter
WORKDIR /usr/src/tcc-exporter
RUN pip install dumb-init
COPY --chown=tcc-exporter:tcc-exporter . /usr/src/tcc-exporter/
EXPOSE 9101
ENV TCC_USERNAME=<username> TCC_PASSWORD=<password> TCC_EXPORTER_PORT=9101
ENTRYPOINT ["dumb-init", "--"]
CMD ["python", "./tcc-exporter"]
