{% if data['id'].startsiwh('minion5') %}
minion_rejoin:
  local.cmd.run:
    - tgt: {{ data['id'] }}
    - arg:
      - echo testEvnet >> /tmp/event
{% endif %}
