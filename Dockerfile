FROM centos:7

LABEL maintainer="Ilija Vukotic <ivukotic@cern.ch>"

RUN yum install -y epel-release.noarch

# Install dependencies for rucio
RUN yum install -y \
    httpd \
    git \
    curl \
    wget \
    python3 \
    krb5-user \
    libaio \
    mod_auth_kerb \
    mod_ssl \
    mod_wsgi \
    openssl-devel.x86_64 \
    python-devel.x86_64 \
    python-pip \
    vim

#   gcc \
#   gridsite \

# RUN export DEBIAN_FRONTEND=noninteractive && \
#     apt-get update && apt-get install -y --allow-unauthenticated \
#     build-essential \
#     git \
#     krb5-user\
#     libzmq3-dev \
#     pkg-config \
#     python \
#     python-dev \
#     python3 \
#     rsync \
#     software-properties-common \
#     unzip \
#     zip \
#     zlib1g-dev \
#     vim \
#     curl \
#     wget \
#     python-pip \
#     python3-pip \
#     openjdk-7-jdk \
#     && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/*

#   module-init-tools \
#   openjdk-8-jdk \
#   openjdk-8-jre-headless \


# RUN pip install --upgrade pip && \
#     pip3 install --upgrade pip


# # pig

# ENV PIG_VERSION 0.17.0
# RUN curl -LO http://apache.cs.utah.edu/pig/pig-$PIG_VERSION/pig-$PIG_VERSION.tar.gz && \
#     tar xzf pig-$PIG_VERSION.tar.gz && \
#     rm pig-$PIG_VERSION.tar.gz
# ENV PATH $PATH:/pig-$PIG_VERSION/bin

# # es-pig - if full es-hadoop integrations is not needed
# RUN curl -LO http://central.maven.org/maven2/org/elasticsearch/elasticsearch-hadoop-pig/5.6.5/elasticsearch-hadoop-pig-5.6.5.jar

# # es-hadoop - for all the modules (pig, mr, spark)
# RUN curl -LO http://download.elastic.co/hadoop/elasticsearch-hadoop-6.1.1.zip && \
#     unzip elasticsearch-hadoop-6.1.1.zip && \
#     rm elasticsearch-hadoop-6.1.1.zip

# # python3
# RUN pip3 --no-cache-dir install \
#     h5py \
#     tables \
#     numpy \
#     pandas \
#     scipy \
#     sklearn \
#     elasticsearch 

# # build info
# RUN echo "Timestamp:" `date --utc` | tee /image-build-info.txt

# RUN useradd -ms /bin/bash analyticssvc

# USER analyticssvc
# WORKDIR /home/analyticssvc

# COPY run run
# RUN chmod 755 run

# #execute service
# CMD ["run"]