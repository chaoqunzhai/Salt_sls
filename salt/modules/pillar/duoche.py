#!/usr/bin/python
def __virtual__():
  return True
def ext_pillar(minion_id,pillar,*args,**kwargs):
  duochelist=['duoche118','duoche119','duoche130','duoche131','duoche132','duoche133','duoche137','duoche138']
  if minion_id in duochelist:
    duoche={}
    for i in duochelist:
      if minion_id == i:
        duoche[i] = duochelist.index(i)
    return {'duoche':duoche}
