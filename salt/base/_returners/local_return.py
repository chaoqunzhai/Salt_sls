import json
import MySQLdb
def __virtual():
  return 'local_returner'
def returner(ret):
  result_file = '/var/log/salt/returner.log'
  with open(result_file,'a+') as result:
    try:
      if ret['return']['ip'] and ret['fun'] == str("grains.items"):
        result.write(str(json.dumps(ret.values()))[1:-1]+'\n')
        result.write(str(json.dumps(ret))+'\n')
        result.write(str(json.dumps(ret["return"]['ip'] + str(ret['success']) + '\n' )))
        conn=MySQLdb.connect(host='172.16.30.133',user='Salt',passwd='Salt',db='Salt',port=3306)
        cursor=conn.cursor()
        sql = 'INSERT INTO salt_hostname (ip,disk,cpu,kernel,source) VALUES (%s,%s,%s,%s,%s)'
        cursor.execute(sql %(str(json.dumps(ret['return']['ip'])),str(json.dumps('40G')), '"' +str(json.dumps(ret['return']['num_cpus'])) + '"',str(json.dumps(ret['return']['osfinger'])),'"' + str(json.dumps(1)) + '"'))
        conn.commit()
        cursor.close()
        conn.close()
        result.write(str('MysqlYes'+'\n'))
      else:
        result.write(str('Notgrains'+'\n'))
    except Exception as e:
	    print e
