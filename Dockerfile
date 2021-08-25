FROM ubuntu

COPY . .
ENTRYPOINT [/jenkins/scripts/deliver.sh]
