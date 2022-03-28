# uri.semic.eu-puris
A repository holding the PURIs published on uri.semic.eu. The software (proxy) that inteprets this repository is https://github.com/SEMICeu/uri.semic.eu-proxy.


This repository is the publishing environment of machine readible content of the SEMIC managed URIs. It aggregates all the machine readible content in one repository. The proxy service will serve the content of this repository to the public. 

A URI in a SEMIC managed domain (e.g. data.europa.eu/m8g) will be in this repository stored in such a way that a proxy can easily read it from disk.

The structure is as follows:
```
	releases/{PURI}/{entitypath}.{format}
```

For instance, the content for the URI `http://data.europa.eu/m8g/bias` in n-triples format will be stored in the repository as `releases/m8g/bias.nt`.

URIs with extended paths are also supported. For instance, a URI `http://data.europa.eu/REF/A/B` will be stored in ntriples format in the repository as `releases/REF/A/B.nt`.

Any further restriction/expectations on the path representations are found in the https://github.com/SEMICeu/uri.semic.eu-proxy. 

The PURI service can support any format, but to limit the effort of the editors 3 common RDF serialisations [RDF/XML, Turtle, ntriples](https://github.com/SEMICeu/uri.semic.eu-proxy/blob/main/urisemic.lua#L42) are active in the proxy service. This means that editors should provide the content in at least these serialisations.




## URI Versioning
As URIs cannot be removed, only deprecated, there is no immediate need for explicit version management beyond what is offered by github.

To implement the usecase in which one could request the version of the URI at a certain date, then the repository structure might be expanded to reflect that.
For now this has not been included.



## Initialising content  
In `/scripts` there are scripts that support to create content according to the expected layout based on the master content of the machine-readible specification (an RDF file).

These scripts are in an experimental stage, sufficient to bootstrap this content. In the future an integration in the creation process of the vocabulary associated wih the PURI's can replace these.

For the m8g domain, the script `process.sh` will create the expected structure and content. In addition, the script `listuris.sh` supports the creation of a mapping table for forwarding the requests having a html response to the right place. To be used the updated mapping table has to be included in [the proxy](https://github.com/SEMICeu/uri.semic.eu-proxy/blob/main/htmlmap.lua).


## Management.
This is not the master repository of the URIs. Any URI that is minted and maintained by SEMIC has a master repository containing the term's definition and core content.
In this repository that information is stored in a form that is optimal for the proxy serving the URI's.
Ideally there is an automation between both repositories, but this has not been established yet.

### Adding (or adapting the content of) a new URI
For a URI create a file in the directory that corresponds with the path in the URI in the [releases](https://github.com/SEMICeu/uri.semic.eu-puris/tree/main/releases/) directory. For each RDF serialization a file has to be created. To adapt the content returned for a URI adapt the content of each corresponding file.
In addition to the RDF content also the mapping on the html target URL must be done. This is part of the [proxy configuration](https://github.com/SEMICeu/uri.semic.eu-proxy#adding-a-new-puri).

Providing information on the wrong path or not providing all the serializations will not lead to execution failure of proxies. End users will get a proper 404 HTTP error. Resolving is by correcting the provided content.


### Access to the repository
This repository is also made available through github pages. This facilitates the implementation of the PURI proxy, because then the PURI handling proxy can redirect to the latest content of the repository. 

Operational dependency note: if github is down, then the PURI service is unable to provide content.



  
