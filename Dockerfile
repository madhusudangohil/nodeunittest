# Lets not just use any old version but pick one
FROM node:6.10.3

ENV java_version 1.8.0_51
ENV filename jdk-8u51-linux-x64.tar.gz
ENV JAVA_HOME /opt/java-oracle/jdk$java_version
ENV PATH $JAVA_HOME/bin:$PATH

# This is needed for flow, and the weirdos that built it in ocaml:
RUN apt-get update && apt-get install -y zip

# RUN apt-get install -y awscli
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
# RUN apt-get install -y python3-pip python-dev build-essential

RUN pip3 install --upgrade pip

RUN pip3 install awscli

RUN export PATH=~/.local/bin:$PATH

RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/$filename -O /tmp/$filename --progress=bar:force; \
  mkdir -p /opt/java-oracle && tar -zxf /tmp/$filename -C /opt/java-oracle/;  \
  update-alternatives --install /usr/bin/java java $JAVA_HOME/bin/java 20000; \
  update-alternatives --install /usr/bin/javac javac $JAVA_HOME/bin/javac 20000; \

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

WORKDIR /usr/local
RUN curl --insecure -o ./sonarscanner.zip -L  https://repo1.maven.org/maven2/org/sonarsource/scanner/cli/sonar-scanner-cli/3.0.3.778/sonar-scanner-cli-3.0.3.778.zip
RUN unzip sonarscanner.zip
RUN rm sonarscanner.zip

ENV SONAR_RUNNER_HOME=/usr/local/sonar-scanner-3.0.3.778
ENV PATH $PATH:/usr/local/sonar-scanner-3.0.3.778

RUN useradd jenkins --shell /bin/bash --create-home
USER jenkins
