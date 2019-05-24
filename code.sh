echo $(date);
	Wed Oct 17 11:30:02 CST 2018
echo $(date '+%Y%m%d');
	20181017
echo $(date -d '20181017' '+%s');
	1539705600
echo $(date -d "$(date '+%Y%m%d')" '+%s');
	1539705600
echo $(date -d '@1539705600' '+%Y%m%d');
	20181017
echo $(date -d "@$(date -d "$(date '+%Y%m%d')" '+%s')" '+%Y%m%d');
	20181017
echo $(date '+%Y-%m-%d %H:%M:%S');
	2018-10-17 11:35:03
echo $(date -d '2018-10-17 11:35:03' '+%s');
	1539747303
echo $(date -d "$(date '+%Y-%m-%d %H:%M:%S')" '+%s');
	1539747303
echo $(date -d "@1539747303" '+%Y-%m-%d %H:%M:%S');
	2018-10-17 11:35:03

beg_s=$((1538755200+86400));
# ---------------------------------------------------------------------------------------------------
sum=0
for((i=1;i<=100;i++));do
	sum=$(($sum+$i))
done
for skill in Ada Coffe Action Java;do
    echo I am good at ${skill}Script
done
for i in $(seq 1 100);do
  echo $i
done
# ---------------------------------------------------------------------------------------------------
your_name=runoob
echo Hello, I know you are \"$your_name\"！
echo 执行的文件名：$0
echo 共几个参数：$#
echo 第1个参数为：$1
echo 第2个参数为：$2
echo 第3个参数为：$3
# ---------------------------------------------------------------------------------------------------
function fun(){
	if [ $# -gt 0 ];then
		for arg in $@;do
			echo $arg
		done
	fi
}
fun $@
# ---------------------------------------------------------------------------------------------------
echo $(date -d '-1 day' '+%Y%m%d');
echo $(date -d '0 day' '+%Y%m%d');
echo $(date -d '1 day' '+%Y%m%d');
echo $(date -d '0 day' '+%Y%m%d');
echo $(date -d '0 day' '+%Y-%m-%d %H:%M:%S');
echo $(date -d '0 day' '+%Y%m%d%H%M%S');
echo $(date -d '0 day' '+%s');	1539788901
echo $(date -d '0 day' '+%Y');	2018
echo $(date -d '0 day' '+%m');	10
echo $(date -d '0 day' '+%d');	17
echo $(date -d '0 day' '+%H');	23
echo $(date -d '0 day' '+%M');	17
echo $(date -d '0 day' '+%S');	24
echo $(date -d '0 day' '+%y');	18
hhh=$(date -d '1 day' '+%Y-%m-%d %H:%M:%S');
echo $hhh
echo $(date -d '2018-10-18 10:16:09' '+%s');
echo $(date -d "$hhh" '+%s');
echo $(date -d "$(date -d '1 day' '+%Y-%m-%d %H:%M:%S')" '+%s');
echo $(date --date=$hhh '+%s');
echo $(date -d '2018-10-17 23:17:24' '+%s');
echo $(date -d $(date +%Y%m%d) '+%s');
echo $(date '+%s');
# %h为月份
echo $(date -d day +%h);	Oct
# ---------------------------------------------------------------------------------------------------
$()是执行里面的代码得到的结果
${}是参数，{}是为了避免后面的影响到了，比如参数${a}a这样连着使用。如果不用{}，系统就会识别成$aa了
# ---------------------------------------------------------------------------------------------------
day_behavior_start=$(date -d '-3 day' +%Y%m%d)
lftp -u hadoop_ftp02,t8T3ArcLe48HV sftp://10.153.84.8 <<EOF
	cd /logcenterO1/chroot_sftp_data/hadoop_ftp/hadoop_data
	lcd /home/work/recom/offlinedata/mmdata/rawdata_behavior
	mirror -v -N $day_behavior_start -i "mmbehavior.*log" xttj
	mirror -v -N $day_behavior_start -i "wapbehavior_*" xttj
	by
EOF
# ---------------------------------------------------------------------------------------------------
if [ $# -eq 1 ];then
      DAY=$1
else
      DAY=$(date -d '-1 day' +%Y%m%d)
fi
lftp -u hadoop_ftp02,t8T3ArcLe48HV sftp://10.153.84.8 <<EOF
	cd /logcenterO1/chroot_sftp_data/hadoop_ftp/hadoop_data/ssms
	lcd /home/work/recom/offlinedata/mmdata/rawdata_content
	mget i_device_resource/ftpFiles/*${DAY}*.txt
	mget i_r_gcontent/ftpFiles/*${DAY}*.txt
	mget i_rb_book/ftpFiles/*${DAY}*.txt
	mget i_rb_reference/ftpFiles/*${DAY}*.txt
	mget i_rb_type/ftpFiles/*${DAY}*.txt
	mget i_rb_author/ftpFiles/*${DAY}*.txt
	mget i_v_dprogram/ftpFiles/*${DAY}*.txt
	mget i_v_dprogram_p/ftpFiles/*${DAY}*.txt
	by
EOF
# ---------------------------------------------------------------------------------------------------
-eq
-ne
-gt
-lt
-ge
-le
zip file1.zip file1 打包
zip -r file1.zip file1 file2 dir1 将几个文件和目录同时压缩成一个zip格式的压缩包
useradd user1 创建一个新用户
userdel -r user1 删除一个用户('-r'排除主目录)
passwd user1 修改一个用户的口令(只允许root执行)
cp dir/* . 复制一个目录下的所有文件到当前工作目录
cd ../.. 返回上两级目录
cd - 返回上次所在的目录
ls -l 显示文件和目录的详细资料
ls -a 显示隐藏文件
ls *[0-9]* 显示包含数字的文件名和目录名 
tree 显示文件和目录由根目录开始的树形结构
mkdir dir1 dir2 同时创建两个目录
mkdir -p ./tmp/dir1/dir2 创建一个目录树
linux中true为0，false为1
# ---------------------------------------------------------------------------------------------------
exit 0

