FROM sumeetchhetri/ffead-cpp-v-picov-raw-async-qw-profiled-base:6.1

ENV IROOT=/installs

WORKDIR /

CMD ./run_ffead.sh ffead-cpp-6.0-sql v-picov postgresql-raw-async memory