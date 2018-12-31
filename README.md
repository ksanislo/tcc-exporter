A python based Total Connect Comfort portal data to prometheus exporter.

Based on [hufman/total-connect-comfort](https://github.com/hufman/total-connect-comfort).


Avaliable from the docker hub:

docker run -t
  -v tcc-exporter-config:/usr/src/tcc-exporter/persistent
  -p 9528:9528
  ksanislo/tcc-exporter

The default config location is "persistent/config.yml" and can changed via the environment variable TCC\_CONFIG\_FILE.

If you mount the folder containing your config.yml and cookies.txt as a volume, the login cookies can be maintained between restarts. This can greatly help prevent being temporarily blocked by the TCC portal for logging in too fast. 

By default, the server will answer any request with prometheus "/metrics", so be sure to restrict access as needed elsewhere.
