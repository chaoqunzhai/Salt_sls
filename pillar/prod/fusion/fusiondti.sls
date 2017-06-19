fusion-server:
  backupFusionPath: /var/rtti/fusion/
  db_jdbcUrl: jdbc:mysql://192.168.23.100:3306/siweidtirtti?useUnicode=true&characterEncoding=gbk
  db_user: dti
  db_password: dti_rtti
  memcacheServer: 192.168.23.123:11211,192.168.23.191:11211
  jobXmlPath: file:/var/rtti/configure/1100/WEATHER_1100/WeatherJob.xml
  file: fusion-dti
