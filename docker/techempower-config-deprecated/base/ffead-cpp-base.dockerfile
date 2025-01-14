FROM sumeetchhetri/ffead-cpp-deps:6.1
LABEL maintainer="Sumeet Chhetri"
LABEL version="6.1"
LABEL description="Base ffead-cpp docker image with commit id - master"

ENV IROOT=/installs
ENV DEBUG=off

ENV DEBIAN_FRONTEND noninteractive
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

#COPY t1/ /installs/t1/
#COPY t3/ /installs/t3/
#COPY t2/ /installs/t2/
#COPY t4/ /installs/t4/
#COPY t5/ /installs/t5/

WORKDIR ${IROOT}

COPY install_ffead-cpp-framework.sh install_ffead-cpp-httpd.sh install_ffead-cpp-nginx.sh server.sh ${IROOT}/
RUN chmod 755 ${IROOT}/*.sh
RUN ./install_ffead-cpp-framework.sh && ./install_ffead-cpp-httpd.sh && ./install_ffead-cpp-nginx.sh && cd ${IROOT}/ffead-cpp-src && ninja clean && rm -rf CMakeFiles CMakeCache.txt

COPY run_ffead.sh /
RUN chmod 755 /run_ffead.sh
