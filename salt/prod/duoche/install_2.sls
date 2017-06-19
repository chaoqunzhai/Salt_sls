duoche_server_2:
  file.managed:
    - name: /usr/local/src/TiCalService.tar.gz
    - source: salt://duoche/files/TiCalService.tar.gz
    - user: root
    - group: root
    - mode: 655
  cmd.run:
    - name: tar -zxf /usr/local/src/TiCalService.tar.gz -C /usr/local/ && mv /usr/local/TiCalService /usr/local/TiCalService{{ grains['duoche2'] }}
duoche_config_2:
  file.managed:
    - name: /usr/local/TiCalService{{ grains['duoche2'] }}/Config.xml
    - source: salt://duoche/files/Config_1.xml
    - user: root
    - group: root
    - mode: 777
    - template: jinja
duoche_sh_2:
  cmd.script:
    - name: /usr/local/TiCalService{{ grains['duoche2'] }}/duoche.sh
    - source: salt://duoche/files/duoche.sh
    - user: root
    - group: root
    - mode: 777
duoche_running_2:
  cmd.run:
    - name: /bin/bash /usr/local/TiCalService{{ grains['duoche2'] }}/duoche.sh
    - unless: ps -ef | grep TiCalService
    - require:
#       - file: single1-config
       - file: duoche_server
