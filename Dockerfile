FROM dockerfile/java:oracle-java8
MAINTAINER Martin Kretz <martin.kretz@bitbetter.se>

# Install logstash from package
RUN wget -qO - https://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add -
RUN add-apt-repository "deb http://packages.elasticsearch.org/logstash/1.4/debian stable main"
RUN apt-get -q update
RUN apt-get -qy install logstash=1.4.2-1-2c0f5a1

# Add config
ADD logstash.agent.conf /etc/logstash/conf.d/agent.conf

# Install monit
RUN apt-get -y install monit
ADD logstash.monit.conf /etc/monit/conf.d/logstash.monit.conf

# Expose logstash listening port
EXPOSE 4560

# Run supervisor
WORKDIR /tmp
CMD ["/usr/bin/monit", "-d 10", "-I"]
