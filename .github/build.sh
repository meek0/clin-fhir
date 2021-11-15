#!/usr/bin/env bash
set -euo pipefail

echo "Running pip install"
pip install .

mv site_root/input/resources/terminology/CodeSystem-hp.json CodeSystem-hp.json
mv site_root/input/resources/examples examples
#fhirutil validate --clear_output site_root/ig.ini
wget https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar -O scripts/publisher.jar
gem install jekyll
java -jar scripts/publisher.jar -ig site_root/ig.ini
mv CodeSystem-hp.json site_root/input/resources/terminology/CodeSystem-hp.json

# replace gh-pages root ig directory with site_root/output
git remote set-branches origin '*'
git fetch origin gh-pages
git checkout -f gh-pages
git rm -rf --ignore-unmatch ig

# ignore unnecessary files
sudo mv -f site_root/output ig
sudo mkdir -p ignored
sudo mv ig/*.zip ignored
sudo mv ig/*.tgz ignored
sudo mv ig/*.pack ignored

# commit and push the generated IG
git add ig
git config --global user.email "no-mail"
git config --global user.name "ig-deploy-bot"
git commit -m "Deploy the implementation guide."
if [ $? -ne 0 ]; then
    echo "nothing to commit"
    exit 0
fi
git push -fq "https://${REPO_TOKEN}@github.com/${GITHUB_REPOSITORY}.git" gh-pages