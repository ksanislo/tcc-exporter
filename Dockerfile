FROM python:3.7
EXPOSE 9528
RUN groupadd --gid 5001 tcc-exporter && useradd --no-log-init --no-create-home --home-dir /usr/src/tcc-exporter --uid 5001 --gid 5001 --shell /bin/false tcc-exporter
RUN mkdir -p /usr/src/tcc-exporter && chown tcc-exporter:tcc-exporter /usr/src/tcc-exporter
WORKDIR /usr/src/tcc-exporter
RUN pip install dumb-init
RUN pip install pyyaml
ENTRYPOINT ["dumb-init", "--"]
CMD ["python", "./tcc-exporter"]
ENV TCC_CONFIG_FILE="persistent/config.yml"
COPY --chown=tcc-exporter:tcc-exporter . /usr/src/tcc-exporter/
RUN python -OO -m py_compile tcc-exporter
