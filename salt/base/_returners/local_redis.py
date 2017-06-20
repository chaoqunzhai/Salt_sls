import redis
import json


def returner(ret):
  pool = redis.ConnectionPool(host='172.16.30.133',port=6379,db='1',password='salt6379')
  redis_recv=redis.Redis(connection_pool=pool)
  data= ret['jid'] + '__' + json.dumps(ret['return'])
  redis_recv.lpush(__grains__['id'],data)
