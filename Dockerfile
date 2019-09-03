FROM corpusops/ubuntu-bare:18.04
WORKDIR /host
ADD apt.txt *.sh ./
RUN sh -exc ': \
        && apt update -qqy && apt install -yqq $(egrep -v "^#" apt.txt)'
ENTRYPOINT [/host/entrypoint.sh]
