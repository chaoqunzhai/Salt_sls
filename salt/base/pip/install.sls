pip_install:
  file.managed:
    - name: /usr/local/src/PyMySQL3-0.5.tar.gz
    - source: salt://pip/files/PyMySQL3-0.5.tar.gz
    - user: root
    - group: root
  cmd.run:
    - name: cd /usr/local/src/ && tar -zxvf PyMySQL3-0.5.tar.gz && cd PyMySQL3-0.5 && python setup.py install
    - unless: test -d /usr/local/src/PyMySQL3-0.5.tar.gz
    - require:
      - file: pip_install
