FROM ubuntu:alpine

COPY . .
ENTRYPOINT [/jenkins/scripts/deliver.sh]
