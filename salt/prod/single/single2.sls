single2-install:
  file.managed:
    - name: /usr/local/src/SingleTiService.tar.gz
    - source: salt://single/files/SingleTiService.tar.gz
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: cd /usr/local/src/ && tar xvf SingleTiService.tar.gz -C /usr/local/ && cd /usr/local/ && mv SingleTiService SingleTiService{{ grains['singleServer2'] }}
    - unless: test -d /usr/local/SingleTiService{{ grains['singleServer2'] }}
    - require:
      - file: single2-install
single2-config:
  file.managed:
    - name: /usr/local/SingleTiService{{ grains['singleServer2']}}/config/config.ini
    - source: salt://single/files/config2.ini
    - user: root
    - group: root
    - mode: 755
    - template: jinja
  cmd.run:
    - name: /usr/local/bin/single.sh
    - unless: ps -ef | grep singleTiService
    - require:
      - file: single2-config
#software2:
#  cmd.run:
#    - name: tail -30 /usr/local/SingleTiService{{ grains['singleServer2']}}/nohup.out
