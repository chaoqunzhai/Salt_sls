/etc/hosts:
  file.managed:
    - source: salt://init/files/hosts
    - template: jinja
