mv site_root/input/resources/examples site_root/examples
mv site_root/input/resources/terminology/CodeSystem-hp.json site_root/CodeSystem-hp.json
fhirutil validate --publisher_opts='n/a' site_root/ig.ini
mv site_root/examples site_root/input/resources/examples 
mv site_root/CodeSystem-hp.json site_root/input/resources/terminology/CodeSystem-hp.json 