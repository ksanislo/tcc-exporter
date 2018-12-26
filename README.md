A simple python Total Connect Comfort portal data to prometheus exporter.

Based on [hufman/total-connect-comfort](https://github.com/hufman/total-connect-comfort).


Avaliable from the docker hub:

docker run -t \
    -e TCC_LOGLEVEL=DEBUG \
    -v tcc-exporter-config:/usr/src/tcc-exporter/persistent \
    -p 9101:9101 \
    ksanislo/tcc-exporter

If you mount /usr/src/tcc-exporter/persistent as a volume, the login cookies can be maintained between restarts, helping to prevent being temporarily blocked by the TCC portal. 

By default, the server will answer any request with prometheus "/metrics", so be sure to restrict access as needed elsewhere.
