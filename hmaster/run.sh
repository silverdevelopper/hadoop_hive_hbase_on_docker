#!/bin/bash
/opt/hbase-$HBASE_VERSION/bin/hbase-daemon.sh start thrift
/opt/hbase-$HBASE_VERSION/bin/hbase master start
