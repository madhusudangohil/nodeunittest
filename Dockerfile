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

WORKDIR /usr/local
RUN curl --insecure -o ./sonarscanner.zip -L  https://repo1.maven.org/maven2/org/sonarsource/scanner/cli/sonar-scanner-cli/3.0.3.778/sonar-scanner-cli-3.0.3.778.zip
RUN unzip sonarscanner.zip
RUN rm sonarscanner.zip

ENV SONAR_RUNNER_HOME=/usr/local/sonar-scanner-3.0.3.778-linux
ENV PATH $PATH:/usr/local/sonar-scanner-3.0.3.778-linux/bin

COPY sonar-runner.properties ./sonar-scanner-3.0.3.778-linux/conf/sonar-scanner.properties

RUN useradd jenkins --shell /bin/bash --create-home
USER jenkins
