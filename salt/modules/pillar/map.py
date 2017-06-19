#!/usr/bin/python
def __virtual__():
  return True
def ext_pillar(minion_id,pillar,*args,**kwargs):
  Map={}
  maplist = ['mapmatch1','mapmatch2','mapmatch3','mapmatch4','mapmatch5','mapmatch6','mapmatch7','mapmatch8','mapmatch9','mapmatch10','mapmatch11','mapmatch12','mapmatch13','mapmatch14','mapmatch15']
  for z in maplist:
    if minion_id == z:
      Map[z] = Maplist.index(z)
  return {'Map':Map}
