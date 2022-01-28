DOCKER_NETWORK = hbase
ENV_FILE = hadoop.env
# current_branch := $(shell git rev-parse --abbrev-ref HEAD)
current_branch := 1.0.0-hbase1.7.1
hadoop_branch := 2.0.0-hadoop2.7.4-java8
build:
	sudo docker build -t bde2020/hbase-base:$(current_branch) ./base
	sudo docker build -t bde2020/hbase-master:$(current_branch) ./hmaster
	sudo docker build -t bde2020/hbase-regionserver:$(current_branch) ./hregionserver
	sudo docker build -t bde2020/hbase-standalone:$(current_branch) ./standalone

up: build
	sudo docker-compose up -d

start: up jars2hive
	echo 'hadoop / hive / hbase cluster started!'

wordcount:
	sudo docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:$(hadoop_branch) hdfs dfs -mkdir -p /input/
	sudo docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:$(hadoop_branch) hdfs dfs -copyFromLocal -f /opt/hadoop-2.7.4/README.txt /input/
	sudo docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hadoop-wordcount
	sudo docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:$(hadoop_branch) hdfs dfs -cat /output/*
	sudo docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:$(hadoop_branch) hdfs dfs -rm -r /output
	sudo docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:$(hadoop_branch) hdfs dfs -rm -r /input

jars2hive:
		sudo docker cp hbase-master:/opt/hbase-1.7.1/lib/hbase-client-1.7.1.jar ./jars && \
    sudo docker cp hbase-master:/opt/hbase-1.7.1/lib/hbase-hadoop-compat-1.7.1.jar ./jars && \
    sudo docker cp hbase-master:/opt/hbase-1.7.1/lib/hbase-hadoop2-compat-1.7.1.jar ./jars && \
    sudo docker cp hbase-master:/opt/hbase-1.7.1/lib/hbase-it-1.7.1.jar ./jars && \
    sudo docker cp hbase-master:/opt/hbase-1.7.1/lib/hbase-server-1.7.1.jar ./jars && \
    sudo docker cp ./jars/hbase-client-1.7.1.jar hive-server:/opt/hive/lib/ && \
    sudo docker cp ./jars/hbase-hadoop-compat-1.7.1.jar hive-server:/opt/hive/lib/ && \
    sudo docker cp ./jars/hbase-hadoop2-compat-1.7.1.jar hive-server:/opt/hive/lib/ && \
    sudo docker cp ./jars/hbase-it-1.7.1.jar hive-server:/opt/hive/lib/ && \
    sudo docker cp ./jars/hbase-server-1.7.1.jar hive-server:/opt/hive/lib/
