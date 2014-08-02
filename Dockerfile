# BUILD-USING:    docker build -t buildingbananas/pointofsale .
# DEV-USING       docker run --rm -i -t -h=pointofsale --name=pointofsale-dev --entrypoint=/bin/bash buildingbananas/pointofsale -s
# TEST-USING:     docker run --rm -i -t -h=pointofsale --name=pointofsale-test buildingbananas/pointofsale rspec terminal_spec.rb
# RUN-USING:      docker run -h=pointofsale --name=pointofsale buildingbananas/pointofsale


FROM ubuntu:latest
MAINTAINER Will Weaver <monkey@buildingbananas.com>

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y ruby gem
RUN gem install rspec

RUN useradd -m -s /bin/bash pos_user

WORKDIR /home/pos_user/pos/
ADD . /home/pos_user/pos/
RUN chown -R pos_user:pos_user /home/pos_user
