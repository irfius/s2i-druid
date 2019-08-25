# s2i-druid
Apache Druid 0.15.1 on OpenShift

### To build Build
To build this image locally with s2i:
```sh
$ git pull https://github.com/irfius/s2i-druid.git
$ docker build -t irfius/openshift-druid:1 .
$ s2i build druid/ irfius/openshift-druid:1 irfius/s2i-druid:0.15.1
```

### Running the application with docker-compose 
TODO

### Running the application with openshift 
TODO