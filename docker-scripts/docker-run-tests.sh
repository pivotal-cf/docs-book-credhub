#!/bin/bash -e

docker pull docker.gocd.cf-app.com:5000/docs-docker

docker build book
