# uri.semic.eu-puris
A repository holding the PURIs published on uri.semic.eu


This repository is the publishing environment of machine readible content of the SEMIC managed URIs. It aggregates all the machine readible content in one repository.

A URI in a SEMIC managed domain (e.g. data.europa.eu/m8g) will be in this repository stored in such a way that a proxy can easily read it from disk.

The structure is as follows:
```
	releases/{PURI}/{entitypath}.{format}
```

For instance, the content for the URI `http://data.europa.eu/m8g/bias` in n-triples format will be stored on disk as `releases/m8g/bias.nt`.

URIs with extended paths are also supported. For instance, a URI `http://data.europa.eu/REF/A/B` will be stored in ntriples format in the repository as `releases/REF/A/B.nt`.



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


## management.
This is not the master repository of the URIs. Any URI that is minted and maintained by SEMIC has a master repository containing the term's definition and core content.
In this repository that information is stored in a form that is optimal for the proxy serving the URI's.
Ideally there is an automation between both repositories, but this has not been established yet.

### Adding (or adapting the content of) a new URI
For a URI create a file in the directory that corresponds with the path in the URI in the [releases](https://github.com/SEMICeu/uri.semic.eu-puris/tree/main/releases/) directory. For each RDF serialization a file has to be created. To adapt the content returned for a URI adapt the content of each corresponding file.
In addition to the RDF content also the mapping on the html target URL must be done. This is part of the [proxy configuration](https://github.com/SEMICeu/uri.semic.eu-proxy#adding-a-new-puri).

### Supportive scripts
As the master repositories of the Core Vocabularies normally contain an RDF file describing the Core Vocabulary, bash scripts have been made to transform a RDF file into a directory structure with RDF files according to the rules of this repository. The script [process.sh](https://github.com/SEMICeu/uri.semic.eu-puris/blob/main/scripts/process.sh) transforms the content for the m8g domain.

When executed in the scripts directory a subdirectory `dir` will be created. This content can then be copied to the target directory releases in this repository.




  
