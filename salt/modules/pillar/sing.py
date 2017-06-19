#!/usr/bin/python
def __virtual__():
  return True
def ext_pillar(minion_id,pillar,*args,**kwargs):
  sing={}
  pillar={}
  Sinlist=['single120','single121','single122','single123','single124','single125','single126','single127']
  for z in Sinlist:
    if minion_id == z:
      sing[z] = Sinlist.index(z)
      pillar['kernel'] = __grains__['kernel']
  return {'Type': pillar,'sing':sing}
