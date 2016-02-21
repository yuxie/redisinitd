.PHONY:

# check for basic deps
HAVE_WGET := $(shell which wget)
HAVE_PKGCONFIG := $(shell which pkg-config)
HAVE_AUTOMAKE := $(shell which automake)
HAVE_AUTOCONF := $(shell which autoconf)

ifndef HAVE_WGET
$(error wget is missing)
endif
ifndef HAVE_PKGCONFIG
$(error pkgconfig is missing)
endif
ifndef HAVE_AUTOMAKE
$(error automake is missing)
endif
ifndef HAVE_AUTOCONF
$(error autoconf is missing)
endif

eq = $(and $(findstring $(1),$(2)),$(findstring $(2),$(1)))

ALL:
	$(if $(call eq, $(shell whoami), root), @echo installing, \
	$(error install as root. perhaps try sudo make))
	wget http://download.redis.io/releases/redis-3.0.7.tar.gz
	tar xzf redis-3.0.7.tar.gz && rm redis-3.0.7.tar.gz && cd redis-3.0.7 && make
	rm -rf /usr/local/redis && mv redis-3.0.7 /usr/local/redis
	rm -rf /etc/redis && mkdir /etc/redis && cp redis.conf /etc/redis/redis.conf
	if [ ! -d "/data/redis/" ]; then mkdir -p /data/redis; fi
	rm -rf /etc/init.d/redis && cp redis /etc/init.d/redis
	chmod a+x /etc/init.d/redis
	update-rc.d redis defaults
	@echo kk
	@echo init.d service installed
