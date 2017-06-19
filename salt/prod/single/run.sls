runserver:
  cmd.script:
    - name: /usr/local/bin/single.sh
    - source: salt://single/files/single.sh
    - user: root
    - group: root
    - mode: 777
    - shell: /bin/bash
    - template: jinja
