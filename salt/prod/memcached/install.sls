include:
  - pkg.pkg-init
  - user.www
memcached-source-install:
  file.managed:
    - name: /usr/local/src/memcached-1.4.13.tar.gz
    - source: salt://memcached/files/memcached-1.4.13.tar.gz
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: cd /usr/local/src && tar zxf memcached-1.4.13.tar.gz && cd memcached-1.4.13 && ./configure --prefix=/usr/local/memcached --enable-64bit && make && make install
    - unless: test -d /usr/local/memcached
    - require:
      - file: memcached-source-install
memcached-service:
  cmd.run:
    - name: /usr/local/memcached/bin/memcached -d -m 512MB -p 11211 -c 8096 -u www
    - unless: netstat -tnlp | grep 11211
    - require:
      - cmd: memcached-source-install
      - user: www-user-group

