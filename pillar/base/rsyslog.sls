{% if grains['osrelease'] == '2008ServerR2' %}
syslog:2008
{% elif grains['os'] == 'Windows' %}
syslog:windows
{% else %}
syslog:none
{% endif %}
