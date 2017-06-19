mapmatch-install:
  file.managed:
    - name: /usr/local/src/mapmatch.tar.gz
    - source: salt://mapmatch/files/mapmatch.tar.gz
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: cd /usr/local/src/ && tar -zxvf mapmatch.tar.gz -C /usr/local/
    - unless: test -d /usr/local/mapmatch/config/map/FCDMAP*
    - require:
      - file: mapmatch-install
mapmatch-config:
  file.managed:
    - name: /usr/local/mapmatch/config/config.ini
    - source: salt://mapmatch/files/config.ini
    - user: root
    - group: root
    - mode: 755
    - template: jinja
mapmatch-sh:
  cmd.script:
    - name: /usr/local/mapmatch/mapserver.sh
    - source: salt://mapmatch/files/mapserver.sh
    - user: root
    - group: root
    - mode: 777
#mapmatch_running:
#  cmd.run:
#    - name: /bin/bash /usr/local/mapmatch/mapserver.sh
#    - unless: ps -ef | grep map
#    - require:
#      - file: mapmatch-sh
