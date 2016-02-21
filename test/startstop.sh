#!/bin/sh

sudo /usr/local/redis/src/redis-server /etc/redis/redis.conf
sudo /usr/local/redis/src/redis-cli -s /tmp/redis.sock shutdown

# sudo kill -9 `cat /var/run/redis.pid`

# ps aux | grep redis
# sleep 1;
# sudo kill -9 `cat /var/run/redis.pid`
# sleep 1;
# ps aux | grep redis


#sleep 1;
# if [ -f "/var/run/redis.pid" ]; then
# rm /var/run/redis.pid
