/etc/resolv.conf:
  file.managed:
    - source: salt://init/files/resolv.conf
