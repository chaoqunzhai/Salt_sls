{% if salt['pillar.item']('fusion-server',true) %}
#{% set dir = salt['pillar.get']('fusion-project','33') %}
fusion-core:
  file.managed:
    - name: /usr/local/src/{{ pillar['fusion-server']['file'] }}.tar.gz
    - template: jinja
    - source: salt://fusion/files/{{ pillar['fusion-server']['file'] }}.tar.gz
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: cd /usr/local/src/ && tar xvf {{ pillar['fusion-server']['file'] }}.tar.gz && cp -r /usr/local/src/{{ pillar['fusion-server']['file'] }}/{{ pillar['configfile']}}/configure/ /var/rtti/
    - unless: test -d /usr/local/src/{{pillar['fusion-server']['file']}}.tar.gz && test -d /var/rtti/configure
    - require:
      - file: fusion-core
{% endif %}
