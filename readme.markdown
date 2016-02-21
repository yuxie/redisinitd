# redis w/ init.d service on linux
per defaults in [/etc/redis/redis.conf](redis.conf), we listen on a unix domain
socket at `/tmp/redis.sock`

the service shutdowns that socket from redis-cli in `/etc/init.d/redis stop`,
namely: [`redis-cli -s /tmp/redis.sock shutdown`](redis#L28)

# install the init.d service
```sh
$ git clone https://github.com/reqshark/redisinitd && cd redisinitd
$ sudo make

# test the service or use `sudo /etc/init.d/redis start|stop|restart|status`
$ sudo service redis start
$ sudo service redis status
$ sudo service redis restart

# at this point it's a good idea to do:
$ sudo reboot now
```
