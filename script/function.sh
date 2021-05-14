set -ex

get_CPU_num(){
    local num=`lscpu | grep 'CPU:' | awk '{print $2}'`
    echo ${num}
}

expr `get_CPU_num` \* 2
