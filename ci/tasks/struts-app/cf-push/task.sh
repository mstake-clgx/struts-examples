#!/bin/bash


rm -rf ~/.aws
mkdir ~/.aws
chmod 700 ~/.aws

echo "[default]" > ~/.aws/credentials
echo "aws_access_key_id = ${AWS_ACCESS_KEY}" >> ~/.aws/credentials
echo "aws_secret_access_key = ${AWS_SECRET_KEY}" >> ~/.aws/credentials

echo "[default]" > ~/.aws/config
echo "region = ${AWS_REGION_NAME}" >> ~/.aws/config
echo "output = json" >> ~/.aws/config

DEPLOY_FILE_NAME=$(readlink -f build-artifacts/*.war)

cf login -a $CF_API -u $CF_API_USER -p $CF_API_PASSWORD
echo " Got here. do some more magic with\n " $DEPLOY_FILE_NAME
ls -R


#if [ $? ]
#then
#  for i in `find . -name "*.war"|sort|grep -v test|grep -v mailreader`
#  do
#    cf push -m750m `dirname $i|cut -d'/' -f2` -p $i
#  done
#fi
#
#
#
#cf push $STRUTS_APP_NAME -p $DEPLOY_FILE_NAME -i $UI_APP_INSTANCE_COUNT -d $APPS_DOMAIN_NAME --no-start
#
#array=(${UI_APP_SERVICES//,/ })
#for i in "${!array[@]}"
#do
#    echo "Binding ${array[i]} service to app $STRUTS_APP_NAME"
#    cf bs $STRUTS_APP_NAME ${array[i]}
#done
#
#cf set-env $STRUTS_APP_NAME STRUTS_APP_NAME $STRUTS_APP_NAME
#cf start $STRUTS_APP_NAME