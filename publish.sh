#!/bin/sh
set -e

if [[ ! -z ${OAUTH_URL} ]];
then
  oauth_url="--oauth-url $OAUTH_URL"
fi

if [[ ! -z ${OAUTH_CLIENT_ID} ]];
then
  oauth_client_id="--oauth-client-id $OAUTH_CLIENT_ID"
fi

if [[ ! -z ${OAUTH_CLIENT_SECRET} ]];
then
  oauth_client_secret="--oauth-client-secret $OAUTH_CLIENT_SECRET"
fi

if [[ ! -z ${OAUTH_UMA_AUDIENCE} ]];
then
  oauth_uma_audience="--oauth-uma-audience $OAUTH_UMA_AUDIENCE"
fi

if [[ ! -z ${BASE_URL} ]];
then
  base_url="--base_url $BASE_URL"
fi

if [[ ! -z ${USERNAME} ]];
then
  username="--username $USERNAME"
fi

if [[ ! -z ${PASSWORD} ]];
then
  password="--password $PASSWORD"
fi

fhirutil publish $oauth_url $oauth_client_id $oauth_client_secret $oauth_client_secret $base_url $username $password $@ site_root/input/resources/terminology
fhirutil publish $oauth_url $oauth_client_id $oauth_client_secret $oauth_client_secret $oauth_uma_audience $base_url $username $password $@ site_root/input/resources/extensions
fhirutil publish $oauth_url $oauth_client_id $oauth_client_secret $oauth_client_secret $oauth_uma_audience $base_url $username $password $@ site_root/input/resources/search
fhirutil publish $oauth_url $oauth_client_id $oauth_client_secret $oauth_client_secret $oauth_uma_audience $base_url $username $password $@ site_root/input/resources/profiles
