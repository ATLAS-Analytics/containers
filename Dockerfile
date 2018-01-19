FROM centos:7

LABEL maintainer="Ilija Vukotic <ivukotic@cern.ch>"

RUN yum install -y epel-release.noarch
RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm
RUN yum -y update 

# Install dependencies
RUN yum install -y \
    httpd \
    git \
    curl \
    wget \
    rsync \
    zip \
    unzip \
    vim \
    libaio \
    python-pip \
    python-devel \
    python36u \
    python36u-pip \
    python36u-devel \
    ntp \
    krb5-workstation \
    mod_auth_kerb \
    mod_ssl \
    mod_wsgi \
    openssl-devel \
    java-1.7.0-openjdk 

#     build-essential \
#     krb5-user \
#     libzmq3-dev \
#     pkg-config \
#     software-properties-common \
#     zlib1g-dev 
#   module-init-tools \

#   openjdk-8-jdk \
#   openjdk-8-jre-headless \

# RUN pip install --upgrade pip && \
#     pip3 install --upgrade pip


# pig

ENV JAVA_HOME /usr/lib/jvm/java-1.7.0-openjdk-1.7.0.161-2.6.12.0.el7_4.x86_64/jre

# ENV PIG_VERSION 0.17.0
# RUN curl -LO http://apache.cs.utah.edu/pig/pig-$PIG_VERSION/pig-$PIG_VERSION.tar.gz
# RUN tar xzf pig-$PIG_VERSION.tar.gz
# RUN rm pig-$PIG_VERSION.tar.gz
# ENV PATH $PATH:/pig-$PIG_VERSION/bin

# # es-hadoop - for all the modules (pig, mr, spark)
RUN curl -LO http://download.elastic.co/hadoop/elasticsearch-hadoop-6.1.1.zip 
RUN unzip elasticsearch-hadoop-6.1.1.zip 
RUN rm elasticsearch-hadoop-6.1.1.zip

# hdfs
RUN wget http://archive.cloudera.com/cdh5/one-click-install/redhat/7/x86_64/cloudera-cdh-5-0.x86_64.rpm
RUN yum install -y localinstall cloudera-cdh-5-0.x86_64.rpm
RUN yum install -y pig \
    hbase \
    flume-ng

ENV HADOOP_MAPRED_HOME /usr/lib/hadoop-mapreduce

COPY configs/core-site.xml configs/hdfs-site.xml configs/mapred-site.xml configs/yarn-site.xml /etc/hadoop/conf/

RUN pip install --upgrade pip
RUN pip install --no-cache-dir \
    h5py \
    tables \
    numpy \
    pandas \
    scipy \
    sklearn \
    elasticsearch \
    cx_Oracle \
    requests \
    stomp.py

# python3
RUN pip3.6 install --upgrade pip
RUN pip3.6 install --no-cache-dir \
    h5py \
    tables \
    numpy \
    pandas \
    scipy \
    sklearn \
    elasticsearch \
    cx_Oracle \
    requests \
    stomp.py

COPY configs/krb5.conf /etc/krb5.conf

COPY run.sh run.sh
RUN chmod 755 run.sh

COPY xAOD/run.sh xAOD/
RUN chmod 755 xAOD/run.sh

COPY FTS/run.sh FTS/
RUN chmod 755 FTS/run.sh

# build info
RUN echo "Timestamp:" `date --utc` | tee /image-build-info.txt

RUN useradd -ms /bin/bash analyticssvc

USER analyticssvc
WORKDIR /home/analyticssvc


#execute service
CMD ["/run.sh"]