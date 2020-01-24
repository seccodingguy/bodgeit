# Build via:
# docker build --no-cache -t psiinon/bodgeit -f Dockerfile .
# Run via:
# docker run --rm -p 8080:8080 -i -t psiinon/bodgeit

FROM tomcat:8.0
MAINTAINER Simon Bennetts "psiinon@gmail.com"

COPY contrast.jar /usr/local/tomcat/bin/
COPY contrast_security.yaml /usr/local/tomcat/bin/
COPY setenv.sh /usr/local/tomcat/bin/

RUN curl -s -L https://github.com/psiinon/bodgeit/releases/download/1.4.0/bodgeit.war > bodgeit.war && \
	mv bodgeit.war /usr/local/tomcat/webapps

