duoche_server:
  file.managed:
    - name: /usr/local/src/TiCalService.tar.gz
    - source: salt://duoche/files/TiCalService.tar.gz
    - user: root
    - group: root
    - mode: 655
  cmd.run:
    - name: tar -zxf /usr/local/src/TiCalService.tar.gz -C /usr/local/ &&  mv /usr/local/TiCalService /usr/local/TiCalService{{ grains['duoche1'] }}
duoche_config:
  file.managed:
    - name: /usr/local/TiCalService{{ grains['duoche1'] }}/Config.xml
    - source: salt://duoche/files/Config_1.xml
    - user: root
    - group: root
    - mode: 777
    - template: jinja
duoche_sh:
  cmd.script:
    - name: /usr/local/TiCalService{{ grains['duoche1'] }}/duoche.sh
    - source: salt://duoche/files/duoche.sh
    - user: root
    - group: root
    - mode: 777
duoche_running:
  cmd.run:
    - name: /bin/bash /usr/local/TiCalService{{ grains['duoche1'] }}/duoche.sh
    - unless: ps -ef | grep TiCalService
    - require:
       - file: duoche_server
