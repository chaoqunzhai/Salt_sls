#!/usr/bin/python
import sys
ret={'environment': '','classes': []}
minion5={'environment': 'base'}
minion6={'environment':'prod'}
if sys.argv[1] == 'minion5':
  ret['classes'] = ['cpis']
  ret['environment'] =minion5['environment']
  print ret
else:
 ret['classes'] = ['sshd']
 ret['environment'] =minion6['environment']
 print ret
