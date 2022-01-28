FROM bde2020/hadoop-namenode:2.0.0-hadoop2.7.4-java8

ENV SQOOP_HOME /usr/local/sqoop

RUN curl -s https://ftp.wayne.edu/apache/sqoop/1.4.7/sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz | tar -xz -C /usr/local
RUN ln -s /usr/local/sqoop-1.4.7.bin__hadoop-2.6.0 $SQOOP_HOME

ENV PATH $PATH:$HADOOP_HOME/bin:$SQOOP_HOME/bin

RUN curl -L https://jdbc.postgresql.org/download/postgresql-42.2.18.jar -o postgresql-42.2.18.jar
RUN cp postgresql-42.2.18.jar $SQOOP_HOME/lib

ENV HADOOP_COMMON_HOME /opt/hadoop-2.7.4
ENV HADOOP_MAPRED_HOME /opt/hadoop-2.7.4
RUN which hadoop
RUN ls -al $SQOOP_HOME/lib

ENV HIVE_VERSION=${HIVE_VERSION:-2.3.2}

ENV HIVE_HOME /opt/hive
ENV PATH $HIVE_HOME/bin:$PATH

WORKDIR /opt

#Install Hive libraries
RUN curl -L# https://archive.apache.org/dist/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz | tar -xz -C /opt/
RUN ln -s /opt/apache-hive-${HIVE_VERSION}-bin $HIVE_HOME
RUN cp ${HIVE_HOME}/lib/hive-common-${HIVE_VERSION}.jar $SQOOP_HOME/lib
RUN ls -al $SQOOP_HOME/lib
