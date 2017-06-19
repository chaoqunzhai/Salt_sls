#!/bin/bash
pushd /usr/local/SingleTiService{{ grains['singleServer1']}}/
cp singleTiService singleTiService{{ grains['singleServer1']}} 
sh -c "nohup ./singleTiService{{ grains['singleServer1']}} &> /dev/null &"
popd
pushd /usr/local/SingleTiService{{ grains['singleServer2']}}/
cp singleTiService singleTiService{{ grains['singleServer2']}}
sh -c "nohup ./singleTiService{{ grains['singleServer2']}} &> /dev/null &"
popd
ps -ef | grep sing
exit 0
#cd /usr/local/SingleTiService{{ grains['singleServer2']}}/
#nohup ./singleTiService &
