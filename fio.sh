set -ex

timestamp=`date "+%Y%m%d_%H%M%S"`

job_name=${1}
tmp_path=`pwd`/temp
job_path=`pwd`/job/${1}.job
log_path=`pwd`/log/${1}/${timestamp}
result=`pwd`/log/${1}/${timestamp}_${1}.log

mkdir -p ${tmp_path}
mkdir -p ${log_path}
pushd ${log_path}
# fio test
path=${tmp_path} timestamp=${timestamp} fio ${job_path} > ${result}
# host info
lscpu > host_lscpu.txt
lsblk > host_lsblk.txt
free -h > host_free.txt
df -h > host_df.txt
popd

