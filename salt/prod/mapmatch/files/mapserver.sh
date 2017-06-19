#!/bin/bash
pushd /usr/local/mapmatch/
sh -c "nohup ./mapMatchServer &> /dev/null &"
popd
ps -ef | grep map
exit 0
