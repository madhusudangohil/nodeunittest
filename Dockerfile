# Lets not just use any old version but pick one
FROM node:6.10.3

# This is needed for flow, and the weirdos that built it in ocaml:
RUN apt-get update && apt-get install -y zip

# RUN apt-get install -y awscli
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
# RUN apt-get install -y python3-pip python-dev build-essential

RUN pip3 install --upgrade pip

RUN pip3 install awscli

RUN export PATH=~/.local/bin:$PATH

RUN useradd jenkins --shell /bin/bash --create-home
USER jenkins
