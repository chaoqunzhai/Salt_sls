#!/bin/bash
dir_num=`ls /usr/local/ |grep "TiCalService" |wc -l`
Pid=`ps -ef |grep "Ti" |grep -v grep |awk '{print $2}'`
for i in $Pid;do
	kill -9 i
done

if [ $dir_num -eq 1 ];then
	exit 0
elif [ $dir_num -eq 2 ];then
	for i in `ls /usr/local/ |grep "TiCalService"`;do
		pushd /usr/local/$i
		sh -c "nohup ./TiCalService &> /dev/null &"
	done
fi

popd
ps -ef | grep Ti

exit 0
