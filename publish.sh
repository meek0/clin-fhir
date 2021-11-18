#!/bin/sh
set -e

fhirutil publish $@ site_root/input/resources/terminology
fhirutil publish $@ /app/site_root/input/resources/extensions
fhirutil publish $@ /app/site_root/input/resources/search
fhirutil publish $@ /app/site_root/input/resources/profiles
