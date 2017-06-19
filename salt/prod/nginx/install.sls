include:
  - user.www
nginx-pkg:
  pkg.installed:
    - pkgs:
      - oepnssl-devel
      - pcre-devel
      - zlib-devel
      - unzip
nginx_extrace:
  file.managed:
    - name: /usr/local/src/nginx-1.8.0.tar.gz
    - source: salt://nginx/files/nginx-1.8.0.tar.gz
    - user: root
    - group: root
    - mode: 755
nginx_compile:
  cmd.run:
    - name: cd /usr/local/src/ && tar zxf nginx-1.8.0.tar.gz && cd nginx-1.8.0 && ./configure --prefix=/usr/local/nginx --user=www --group=www --with-http_stub_status_module --with-http_gzip_static_module --with-http_ssl_module --with-http_realip_module && make && make install
    - unless: test -d /usr/local/nginx
    - require:
      - cmd: nginx_extrace
      - pkg: nginx-pkg
      - file: nginx_extrace
 
