single1-install:
  file.managed:
    - name: /usr/local/src/SingleTiService.tar.gz
    - source: salt://single/files/SingleTiService.tar.gz
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: cd /usr/local/src/ && tar xvf SingleTiService.tar.gz -C /usr/local/ && cd /usr/local/ && mv SingleTiService SingleTiService{{ grains['singleServer1'] }}
    - unless: test -d /usr/local/SingleTiService{{ grains['singleServer1'] }}
    - require:
      - file: single1-install
single1-config:
  file.managed:
    - name: /usr/local/SingleTiService{{ grains['singleServer1']}}/config/config.ini
    - source: salt://single/files/config1.ini
    - user: root
    - group: root
    - mode: 755
    - template: jinja
  cmd.run:
    - name: /usr/local/bin/single.sh
    - unless: ps -ef | grep singleTiService
    - require:
      - file: single1-config
