FROM centos:7.6.1810

LABEL io.k8s.description="Apache Druid" \
      io.k8s.display-name="Apache Superset 0.15.1" \
      io.openshift.expose-services="8888:http,8200:http" \
      io.openshift.tags="apache,druid,java,tranquility" \
      maintainer="Irfius <irfius@tuta.io>" \
      io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"

ENV APACHE_DRUID_VERSION=0.15.1 \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.222.b10-0.el7_6.x86_64/jre/bin/java

WORKDIR /app
COPY .s2i/bin/ /usr/libexec/s2i

RUN rpm --import /etc/pki/rpm-gpg/* && \
    yum -y update && \
    yum -y install java-1.8.0-openjdk which && \
    yum -y clean all --enablerepo='*' && \
    mkdir -p druid && \
    chown -R 1001:1001 /app

USER 1001
EXPOSE 8888 8200
CMD ["/usr/libexec/s2i/usage"]