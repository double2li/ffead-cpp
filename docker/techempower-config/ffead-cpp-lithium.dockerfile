FROM buildpack-deps:bionic

ENV IROOT=/installs

COPY te-benchmark-um/ te-benchmark-um/
COPY *.sh ./

RUN mkdir /installs && chmod 755 *.sh && /install_ffead-cpp-dependencies.sh && /install_ffead-cpp-framework.sh && \
	/install_ffead-cpp-httpd.sh && /install_ffead-cpp-nginx.sh && cd ${IROOT}/ffead-cpp-src && make clean && rm -rf CMakeFiles

WORKDIR /

CMD ./run_ffead.sh ffead-cpp-4.0 lithium
