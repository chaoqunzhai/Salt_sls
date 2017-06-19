{% set nginx_user ='www' %}
nginx_conf:
  file.managed:
    - name: /usr/local/nginx/conf/ngin.conf
    - source: salt://nginx/files/nginx.conf
    - template: jinja
    - defaults:
      nginx_user: {{ nginx_user }}
      num_cpus: {{ grains['num_cpus'] }}
nginx_service:
  file.managed:
    - name: /etc/init.d/nginx
    - source: salt://nginx/files/nginx
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - names:
      - /sbin/chkconfig --add nginx && /sbin/chkconfig nginx on
    - unless: /sbin/chkconfig --list nginx
    - require:
      - file: nginx_service
  service.running:
    - name: nginx
    - enable: True
    - reload: True
    - watch:
      - file: /usr/local/nginx/conf/vhost/*.conf
