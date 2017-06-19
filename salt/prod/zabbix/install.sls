zabbix_agentd:
  pkg.installed:
    - name: zabbix22-agent
  file.managed:
    - name: /etc/zabbix_agentd.conf
    - source: salt://zabbix/files/zabbix_agentd.conf
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: mkdir -p /etc/zabbix/zabbix_agentd.d
    - unless: test -d /etc/zabbix/zabbix_agentd.d
#    - require:
#      - file: zabbix_agentd
  service.running:
    - name: zabbix-agentd
    - enbale: True
    - restart: True
    - mkdir: True
    - watch:
      - file: zabbix_agentd
