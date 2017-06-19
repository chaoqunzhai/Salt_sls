#!/bin/bash/python
import time
import salt.utils
def foo(w):
  cmd = '{0}'.format(w)
  return __salt__['cmd.run'](cmd)
