# OpenShift Image Scanner

To build image
```
oc process -f bctemplate.yml | oc create -f -
oc start-build image-scan-base --from-dir=.
```
