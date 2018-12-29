A simple python Total Connect Comfort portal data to prometheus exporter.

Based on [hufman/total-connect-comfort](https://github.com/hufman/total-connect-comfort).


Avaliable from the docker hub:

docker run -t
  -v tcc-exporter-config:/usr/src/tcc-exporter/persistent
  -p 9528:9528
  ksanislo/tcc-exporter

If you mount the folder /usr/src/tcc-exporter/persistent as a volume instead of just mapping the config.yml itself, the login cookies can be maintained between restarts. This helps prevent being temporarily blocked by the TCC portal for logging in too fast. 

By default, the server will answer any request with prometheus "/metrics", so be sure to restrict access as needed elsewhere.
