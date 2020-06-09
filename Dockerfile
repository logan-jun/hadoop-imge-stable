FROM java:8-jre

# Add native libs
ARG HADOOP_VERSION=2.9.0
ADD hadoop-${HADOOP_VERSION}.tar.gz /opt
ADD hadoop-native-${HADOOP_VERSION}.tar /opt/hadoop-${HADOOP_VERSION}/lib/native

ENV HADOOP_PREFIX=/opt/hadoop \
    HADOOP_COMMON_HOME=/opt/hadoop \
    HADOOP_HDFS_HOME=/opt/hadoop \
    HADOOP_MAPRED_HOME=/opt/hadoop \
    HADOOP_YARN_HOME=/opt/hadoop \
    HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop \
    YARN_CONF_DIR=/opt/hadoop/etc/hadoop \
    PATH=${PATH}:/opt/hadoop/bin

RUN \
  cd /opt && ln -s ./hadoop-${HADOOP_VERSION} hadoop && \
  rm -f ${HADOOP_PREFIX}/logs/*

WORKDIR $HADOOP_PREFIX

# Hdfs ports
EXPOSE 50010 50020 50070 50075 50090 8020 9000
# Mapred ports
EXPOSE 19888
#Yarn ports
EXPOSE 8030 8031 8032 8033 8040 8042 8088
#Other ports
EXPOSE 49707 2122
