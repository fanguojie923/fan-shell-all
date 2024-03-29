#!/bin/bash   
CheckProcess()   
{   
        if [[ "$1" = "" ]]  
        then   
                return 1   
        fi 
		
  
    PROCESS_NUM=`ps -ef | grep "$1" | grep -v "grep" | wc -l`   
    if [ $PROCESS_NUM -eq 1 ];   
    then   
        return 0   
    else  
        return 1   
    fi       
}    
  
while [ 1 ] ; do  
    CheckProcess "OrderRedisKey.php"  
    Check_RET=$?   
    if [ $Check_RET -eq 1 ];   
    then   
     pgrep -f OrderRedisKey.php | xargs kill -9  
     nohup php OrderRedisKey.php &   
    fi   
    sleep 1   
done  