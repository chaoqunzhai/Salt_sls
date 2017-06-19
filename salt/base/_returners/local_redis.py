import redis
import json


def returner(ret):
  pool = redis.ConnectionPool(host='172.16.30.133',port=6379)
  redis_recv=redis.Redis(connection_pool=pool)
