include:
  - fusion.config
fusion-install:
  file.managed:
    - name: /usr/local/src/tomcat-{{ pillar['fusion-server']['file'] }}.tar.gz
    - source: salt://fusion/files/tomcat-{{ pillar['fusion-server']['file'] }}.tar.gz
    - user: root
    - group: root
    - mode: 755
{% if salt['pillar.item']('fusion-server',true) %}
  cmd.run:
    - name: cd /usr/local/src/ && tar zxf tomcat-{{ pillar['fusion-server']['file'] }}.tar.gz -C /usr/local/ && cd /usr/local/tomcat-fusion
    - unless: test -d /usr/local/tomcat-fusion
    - require:
      - file: fusion-install
{% endif %}
fusion-config:
  file.managed:
    - name: /usr/local/tomcat-fusion/webapps/fusion/WEB-INF/classes/system.properties
    - source: salt://fusion/files/system.conf
    - mode: 644
    - user: root
    - group: root
    - template: jinja
files:
  cmd.run:
    - name: mkdir -p /var/rtti/fusion/
runserver:
  cmd.run:
    - name: nohup /usr/local/tomcat-fusion/bin/catalina.sh start &
    - unless: netstat -tnlp | grep java
    - require:
       - cmd: software
    - user: root
    - group: root
    - mode: 755
software:
  cmd.run:
    - name: tail -50 /usr/local/tomcat-fusion/logs/catalina.out
