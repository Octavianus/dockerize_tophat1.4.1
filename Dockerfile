### Dockermized Tophat 1.4.1
## use the dockerfile/ubuntu base image provided by https://index.docker.io/u/dockerfile/ubuntu/
# The environment is ubuntu-14.04
FROM dockerfile/python

MAINTAINER David Weng weng@email.arizona.edu
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

## Step 1: Install the basic tools to set up the environment.
# Install the wget, gcc, make tools, handling the lib dependency problem.
RUN apt-get install -y wget

# Make sure the working directory is Vagrant.
WORKDIR /home/vagrant

## Step 2: Download the binary file.
RUN wget --trust-server-name http://ccb.jhu.edu/software/tophat/downloads/tophat-1.4.1.Linux_x86_64.tar.gz
RUN tar xvfz tophat-1.4.1.Linux_x86_64.tar.gz

## Step 3: Add the executables directory to the Path.
ENV PATH /home/vagrant/tophat-1.4.1.Linux_x86_64:$PATH
