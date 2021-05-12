#!/bin/bash

# Abort the script if there is a non-zero error
set -e
script_dir=$(dirname "$0")
wget https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar -O $script_dir/publisher.jar

python3 -m venv venv
. venv/bin/activate
pip install --upgrade pip
python setup.py install_egg_info
pip install -e .

# Test the build
fhirutil -h
