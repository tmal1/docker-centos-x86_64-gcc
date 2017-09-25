FROM centos:centos7.4.1708

# Java Version
ENV JAVA_VERSION_MAJOR=java-1.8.0-openjdk \
    JAVA_VERSION_MINOR=1.8.0.144 \
    JAVA_VERSION_BUILD=0.b01.el7_4 \
    JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.144-0.b01.el7_4.x86_64 \
    PATH=${PATH}:/usr/bin/java

LABEL author="Tomasz Malinowski <t.malinowski@oberthur.com>"
LABEL version="docker-centos_i386-gcc"

RUN yum -y update

RUN yum -y install yum-plugin-ovl epel-release

RUN yum -y install tar unzip wget gcc vim git jq pcre-devel openssl-devel mono-devel ${JAVA_VERSION_MAJOR}-${JAVA_VERSION_MINOR}-${JAVA_VERSION_BUILD}.x86_64 \

# clean up
    && rm -rf /var/cache/yum/* \
    && yum clean all

