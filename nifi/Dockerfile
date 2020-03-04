FROM apache/nifi:latest

USER root

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1


# Install python environment
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip

RUN pip3 install --upgrade pip

# Install python dependencies
COPY /requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt


# Install oracle dependecies
RUN mkdir /opt/oracle
WORKDIR /opt/oracle
RUN wget https://download.oracle.com/otn_software/linux/instantclient/instantclient-basiclite-linuxx64.zip && \
    unzip instantclient-basiclite-linuxx64.zip && rm -f instantclient-basiclite-linuxx64.zip && \
    cd /opt/oracle/instantclient* && rm -f *jdbc* *occi* *mysql* *README *jar uidrvci genezi adrci && \
    echo /opt/oracle/instantclient* > /etc/ld.so.conf.d/oracle-instantclient.conf && ldconfig

RUN apt update -y && apt install libaio1

WORKDIR /opt/nifi/nifi-current

USER nifi
