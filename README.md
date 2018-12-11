A simple python Total Connect Comfort API data to prometheus exporter.

Based on [hufman/total-connect-comfort](https://github.com/hufman/total-connect-comfort).


Avaliable from the docker hub:

docker run -t \
    -e TCC_USERNAME=\<email\> \
    -e TCC_PASSWORD=\<password\> \
    -e TCC_EXPORTER_PORT=9101 \
    -p 9101:9101 \
    ksanislo/tcc-exporter

The http server will answer any request with prometheus "/metrics", so be sure to restrict access as needed elsewhere.
