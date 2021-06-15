# uri.semic.eu-puris
A repository holding the PURIs published on uri.semic.eu


This repository is the publishing environment of machine readible content of the SEMIC managed URIs.

A URI in a SEMIC managed domain (e.g. data.europa.eu/m8g) will be in this repository stored in such a way that a proxy can easily read it from disk.

The structure is as follows:
```
	releases/{PURI}/{entitypath}.{format}
```

For instance, the content for the URI `http://data.europa.eu/m8g/bias` in n-triples format will be stored on disk as `releases/m8g/bias.nt`.

## URI Versioning
As URIs cannot be removed, only deprecated, there is no immediate need for explicit version management beyond what is offered by github.

To implement the usecase in which one could request the version of the URI at a certain date, then the disk structure might be expanded to reflect that.
For now this has not been included.


## creation of the structure
In `/scripts` there are scripts that create a base version based on the master content of the machine-readible specification.
The processing for the m8g domain is initiated from the script `process.sh` 

The script `listuris.sh` supports the creation of a mapping table for forwarding the requests having a html response to the right place.
The reason for this existance is that nog all m8g puris are published as html on one place.
When this would be realized then the proxy and this mapping can be avoided. 

  
