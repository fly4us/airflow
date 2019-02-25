# vim:set ft=dockerfile:
FROM puckel/docker-airflow:1.10.2

ARG AIRFLOW_HOME=/usr/local/airflow

RUN mkdir -p ${AIRFLOW_HOME}/opt/instantclient; \
  mkdir -p ${AIRFLOW_HOME}/opt/clidriver; \
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${AIRFLOW_HOME}/opt/instantclient; \
  export IBM_DB_HOME=${AIRFLOW_HOME}/opt/clidriver
  
RUN set -ex; \
  apt-get update; \
  apt-get install -y --no-install-recommends curl gnupg apt-transport-https; \
  curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -; \
  sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/microsoft.list'; \
  apt-get update; \
  apt-get install -y powershell; \  
  rm -rf /var/lib/apt/lists/*
