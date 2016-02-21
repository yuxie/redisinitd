# redis init.d service on linux
per defaults in [/etc/redis/redis.conf](redis.conf), we listen on a unix domain
socket at `/var/run/redis.sock`.

# install the init.d service
```sh
$ git clone https://github.com/reqshark/redisinitd && cd redisinitd
$ sudo make # build and link the redis-server
$ sudo make install # install the init.d service

$ sudo /etc/init.d/redis start|stop|restart|status

# at this point it's a good idea to do:
$ sudo reboot now
```
