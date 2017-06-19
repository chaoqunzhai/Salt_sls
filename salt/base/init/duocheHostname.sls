/etc/sysconfig/network:
  file.managed:
    - source: salt://init/files/hostname
    - template: jinja
