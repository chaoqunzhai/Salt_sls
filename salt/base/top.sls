base:
  'single*':
    - init.singleHost
  'duoche*':
    - init.duocheHostname
  '*':
    - pip.install
prod:
  35FB:
    - nginx.install
  mapmatch-group:
    - match: nodegroup
    - mapmatch.install
  single-group:
    - match: nodegroup
    - single.install
  duoche-group:
    - match: nodegroup
    - duoche.install
    - duoche.install_2
