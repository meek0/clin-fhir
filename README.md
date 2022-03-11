CLIN Fhir
=========


## Installation

### Prerequisite

Make sure you have Docker CE installed: <https://docs.docker.com/install/>

Docker is needed because it is used by both the `fhirutil` CLI and the
integration tests.

1. Git clone this repository

    ```shell
    git clone git@github.com:Ferlab-Ste-Justine/clin-fhir.git
    cd clin-fhir
    ```

2. Install the necessary requirements

    ```shell
    scripts/build.sh
    ```
   
3. Setup the Python virtual environment

    ```shell
    source ./venv/bin/activate
    ```

4. Install Jekyll following these [instructions](https://learn.cloudcannon.com/jekyll/install-jekyll-on-linux/)
   
### 3. Validate the model

```shell
fhirutil validate ./site_root/ig.ini --publisher_opts='-tx n/a'
```

### 4. Validate and Generate the IG

In case you have new resources files :
```shell
fhirutil add ./site_root/input/resources
```

And then to generate the IG :
```shell
java -jar scripts/publisher.jar -ig site_root/ig.ini -tx n/a
```

### 5. Publishing the model 

```shell
fhirutil publish --base_url <FHIR_API_BASE_URL> --username <USERNAME> --password <PWD>
```

Alternatively you can use docker image :
```shell
docker run -e OAUTH_CLIENT_ID=client_id \
 -e OAUTH_CLIENT_SECRET=client_secret clin-fhir \
 --base_url https://fhir-green.qa.clin.ferlab.bio/fhir \
 --oauth-url https://auth.qa.clin.ferlab.bio/auth/realms/clin/protocol/openid-connect/token \
 --oauth-uma-audience clin-acl
```