#!/usr/bin/python
import salt.client
import subprocess
import commands
#minion_opts = salt.config.minion_config('/etc/salt/minion')



def ipget():
  try:
    (status, output) = commands.getstatusoutput('cat /etc/redhat-release')
    core7=str('7.0.1406')
    if core7 in output.split(' '):
      p=subprocess.Popen("ifconfig `ifconfig | head -n 1 | awk -F : '{print $1}'` |grep 'inet' |awk '{print $2}' | head -n 1",\
stdin=subprocess.PIPE,stdout=subprocess.PIPE,stderr=None,shell=True)
      AA=p.stdout.read()
      AA=AA.split('\n')[0]
      return AA
    else:
#      caller=salt.client.Caller()
      p=p=subprocess.Popen("ifconfig | grep 'inet' |awk '{print $2}' | head -n 1 |  awk -F : '{print $2}'",\
stdin=subprocess.PIPE,stdout=subprocess.PIPE,stderr=None,shell=True)
      AA=p.stdout.read()
      AA=AA.split('\n')[0]
#      AA=caller.sminion.functions['grains.item']('fqdn_ip4')['fqdn_ip4']
      return AA
  except Exception as e:
   return None
def grains():
  local={}
 # local['Roles']='--'
#  if minion_opts['id'] == 'map141':
  local['ip'] = ipget()
#  elif caller.sminion.functions['grains.item']('osfinger') == 'CentOS-6':
#    local['ip'] = caller.sminion.functions['grains.item']('fqdn_ip4')
  return local
