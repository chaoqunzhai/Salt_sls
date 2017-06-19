from celery import Celery



app = Celery('TASK',
            broker = 'redis://localhost',
            backend='redis://localhost')
@app.task
def add(x,y):
  print 'running add%s%s' %(x,y)
  return x + y

@app.task
def minus(x,y):
  print 'running - %s%s' %(x,y)
  return x - y

