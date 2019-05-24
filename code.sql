--------------------------------------------------------------------------------------------------------------
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public static void userRecommendationCalculation(int[][] sparseMatrix, Map<String, Integer> userItemLength, Map<Integer, String> idUser, int recommendUserId) {
	//计算用户间的相似度
	for (int j = 0;j < sparseMatrix.length; j++) {
		if(j != recommendUserId){
			System.out.println(idUser.get(recommendUserId) + "--" + idUser.get(j) + "相似度：" + sparseMatrix[recommendUserId][j]/Math.sqrt(userItemLength.get(idUser.get(recommendUserId))*userItemLength.get(idUser.get(j))));
		}
	}
}
public static void ItemRecommendationCalculation(int[][] sparseMatrix, Map<String, Integer> userItemLength, Map<String, Set<String>> itemUserCollection, Set<String> items, Map<String, Integer> userID, String recommendUser, int recommendUserId) {
	//计算指定用户recommendUser的物品推荐度
	for(String item: items){//遍历每一件物品
		Set<String> users = itemUserCollection.get(item);//得到购买当前物品的所有用户集合
		if(!users.contains(recommendUser)){//如果被推荐用户没有购买当前物品，则进行推荐度计算
			double itemRecommendDegree = 0.0;
			for(String user: users){
				itemRecommendDegree += sparseMatrix[recommendUserId][userID.get(user)]/Math.sqrt(userItemLength.get(recommendUser)*userItemLength.get(user));//推荐度计算
			}
			System.out.println("The item " + item + " for " + recommendUser + "'s recommended degree:" + itemRecommendDegree);
		}
	}
}
public static int[][] SimilarityMatrixComputation(int[][] sparseMatrix, Map<String, Set<String>> itemUserCollection, Map<String, Integer> userID) {
	//计算相似度矩阵
	Set<Map.Entry<String, Set<String>>> enSet = itemUserCollection.entrySet();
	Iterator<Map.Entry<String, Set<String>>> it = enSet.iterator();
	while (it.hasNext()) {
		Set<String> commonUsers = it.next().getValue();
		for (String user_u : commonUsers) {
			for (String user_v : commonUsers) {
				if (user_u.equals(user_v)) {
					continue;
				}
				sparseMatrix[userID.get(user_u)][userID.get(user_v)] += 1;//计算用户u与用户v都有正反馈的物品总数
			}
		}
	}
	return sparseMatrix;
}
--------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------
passwd username
--------------------------------------------------------------------------------------------------------------
.\mongod -dbpath D:\CodeProgram\MongoDB\mongodbData\db
.\mongo
-----------------
mongod --dbpath=/home/yangshaojie/app/mongodb/db
mongo
--------------------------------------------------------------------------------------------------------------
for (var i = 0; i < 10; i++) {
    db.testCollection01.insert({
        name: 'zhangsan' + i
    })
}
--------------------------------------------------------------------------------------------------------------
mongod --dbpath=/home/yangshaojie/app/mongodb/db
--------------------------------------------------------------------------------------------------------------
function table2csv(){
	var jsonData=[//要导出的json数据
		{name:'路人甲',phone:'123456789',email:'000@123456.com'},
		{name:'炮灰乙',phone:'123456789',email:'000@123456.com'},
		{name:'土匪丙',phone:'123456789',email:'000@123456.com'},
		{name:'流氓丁',phone:'123456789',email:'000@123456.com'},
	]
	let str='';
	for(let i=0; i<jsonData.length; i++ ){
		for(let item in jsonData[i]){
			str+=jsonData[i][item]+'\t';
		}
		str=str.replace(/(\s*$)/g,'')+'\n'
	}
	//encodeURIComponent解决中文乱码
	let uri='data:text/txt;charset=utf-8,\ufeff'+encodeURIComponent(str);
	//通过创建a标签实现
	var link=document.createElement("a");
	link.href=uri;
	//对下载的文件命名
	link.download='json数据表.txt';
	document.body.appendChild(link);
	link.click();
	document.body.removeChild(link);
}
----------------------------------------------------------------------------------------------
set wshshell=createobject ("wscript.shell")
d=wshshell.run("calc",3)
----------------------------------------------------------------------------------------------
def writeFile(input_path, file_name, output_path, columnNum):
    old_file = open(input_path + '/' + file_name, mode='r', encoding='UTF-8')
    num = file_name.split('_')[0]
    new_file = open(output_path + '/' + num + '.html', mode='w', encoding='UTF-8')
    new_file.write('<!DOCTYPE html><html><head><meta charset="UTF-8"><title>' + file_name.split('_')[2].split('.')[0] + '</title></head>' + '\r\n')
    new_file.write('<body>' + '\r\n')
    new_file.write('<table>' + '\r\n')
    str1 = "<td><input type='button' onclick='biaohuang(this)' ondblclick='test(this)' value='"
    str2 = "'/></td>"
    i = 0
    for line in old_file:
        str0 = str1 + line.replace('\n', '').replace('\t', ',') + str2
        if i % columnNum == 0:
            str0 = '<tr>' + '\r\n' + str0 + '\r\n'
            new_file.write(str0)
        elif i % columnNum == columnNum - 1:
            str0 = str0 + '\r\n' + '</tr>' + '\r\n'
            new_file.write(str0)
        else:
            str0 = str0 + '\r\n'
            new_file.write(str0)
        i = i + 1
    if len(old_file.readlines()) % columnNum != 0:
        new_file.write('</tr>' + '\r\n')
    old_file.close()
    new_file.write('</table>' + '\r\n')
    new_file.write("<br><br><br><input type='button' onclick='baocun()' value='保存'/>")
    if num != '30':
        new_file.write("<a href = '" + str(int(num)+1) + ".html'>下一页</a>")
    new_file.write('\r\n' + '</body>' + '\r\n' + '<script src="../js/demo.js"></script>' + '</html>' + '\r\n')
    new_file.close()
import os
for info in os.listdir('input'):
	import re
    if re.match('.*?.txt', info, flags=0):
        writeFile('input', info, 'html', 10)
---------------------------------------------------------------------------------------------------
var tool_a = {
    topImg: '<a href="http://www.idc4.com/" target="_blank"><img src="http://stats.chinaz.com/gj_g/idc4.gif"></a>', //失效,顶部图片tool_468.js
    topTxt: function () {
        var html = "<ul><li><a href=\"http://www.838.cc/222.html\" target=\"_blank\" class=\"col-blue\"> 美国香港服务器CN2直连★快稳</a></li>";
        html += "<li><a href=\"http://www.bthyhz.com/35pan/\" target=\"_blank\" class=\"col-red\">35盘永久免费百G带宽自助上传</a></li>";
        html += "<li><a href=\"http://wpa.qq.com/msgrd?v=3&uin=1244392235&site=qq&menu=yes\" target=\"_blank\" class=\"col-blue\">短信群发,任何内容,三网,0.35元</a></li>";
        html += "</ul>";
        html += "<ul><li><a href=\"http://wpa.qq.com/msgrd?v=3&uin=6400788&site=qq&menu=yes\" target=\"_blank\" class=\"col-red\"> ★集团高价收SEO站量★</a></li>";
        html += "<li><a href=\"http://www.anyiidc.com/usjf.asp?lm=50\" target=\"_blank\" class=\"col-blue\">美国/香港/韩国服务器</a></li>";
        html += "<li><a href=\"http://www.eidc.cn/servers/eidc-g/hkhk.php\" target=\"_blank\" class=\"col-red\">香港CN2★美国★韩国服务器</a></li>";
        html += "</ul>";
        return html;
    }, //顶部文字
    navAfter: function () {//导航下面
        var html = '<div class="fl mr10 ToolsOne"><a href="http://www.360jq.com/hkshuang.htm" target="_blank"><img src="http://stats.chinaz.com/gj_g/360jq.gif" width="215"></a></div>';
        html += '<div class="fl mr10 ToolsTwo"><a href="https://www.yundun.com" target="_blank"><img src="http://stats.chinaz.com/gj_g/yundun.gif"></a></div>';
        html += '<div class="fl ToolsThree"><a href="http://www.kk30.com?ping_you" target="_blank"><img src="http://stats.chinaz.com/gj_g/kk30.gif" width="215"></a></div>';
        return html;
    },
    centerTxt: function () {//中间文字
        var html = "<div class=\"ToolsTxtWrap clearfix\">";
        html += "<ul class=\"ToolslistW\">";
        html += "<li><a href=\"http://www.301wl.com\" target=\"_blank\" class=\"col-red\">【香港高防】【免备案服务器】</a></li>";
        html += "<li><a href=\"http://www.f57.net\" target=\"_blank\" class=\"col-blue\">[傲翔云]香港韩国CN2独服|云主机</a></li>";
        html += "<li><a href=\"http://www.ssf.cc/rent.asp\" target=\"_blank\" class=\"col-red\">45互联-高防妙解服务器-随时退换</a></li>";
        html += "<li><a href=\"https://www.icidc.com/server.html\" target=\"_blank\" class=\"col-blue\">巨牛云-宁波高防BGP火热上线</a></li></ul>";

        html += "<ul class=\"ToolslistW\">";
        html += "<li><a href=\"http://www.dianjiliuliang.com\" target=\"_blank\" class=\"col-blue\">流量提升3000独立ip只需1元</a></li>";
        html += "<li><a href=\"https://www.59dun.com/guoneifuwuqi/wuhangaofang.html\" target=\"_blank\" class=\"col-red\">五九盾-武汉企业高防仅售799</a></li>";
        html += "<li><a href=\"http://0531lh.cn/\" target=\"_blank\" class=\"col-blue\">第三方支付接口QQ153777081</a></li>";
        html += "<li><a href=\"https://www.95idc.com/\" target=\"_blank\" class=\"col-red\">95IDC★香港CN2服务器现机促销</a></li></ul>";

        html += "<ul class=\"ToolslistW\">";
        html += "<li><a href=\"http://www.360jq.com/usfang.htm\" target=\"_blank\" class=\"col-red\">*美国香港★高防★黑科技网站秒开</a></li>";
        html += "<li><a href=\"http://wpa.qq.com/msgrd?v=3&uin=2494788&site=qq&menu=yes\" target=\"_blank\" class=\"col-blue\">★高价收购一切流量Q2494788</a></li>";
        html += "<li><a href=\"http://www.guidun.net/\" target=\"_blank\" class=\"col-red\">★香港高防服务器★24小时★</a></li>";
        html += "<li><a href=\"http://www.fnseo.cn/seozs/\" target=\"_blank\" class=\"col-blue\">——【学SEO技术 】——高手</a></li></ul>";

        html += "<ul class=\"ToolslistW\">";
        html += "<li><a href=\"http://www.wsisp.com/\" target=\"_blank\" class=\"col-blue\">你的美国服务器 抗攻击 速度快吗</a></li>";
        html += "<li><a href=\"http://wpa.qq.com/msgrd?v=3&uin=1892373&site=qq&menu=yes\" target=\"_blank\" class=\"col-red\">苹果短信全国群发,QQ1892373</a></li>";
        html += "<li><a href=\"http://www.xy3000.com\" target=\"_blank\" class=\"col-blue\">★小蚁BGP高防IP★先防御/后收费</a></li>";
        html += "<li><a href=\"http://wpa.qq.com/msgrd?v=3&uin=2786508390&site=qq&menu=yes\" target=\"_blank\" class=\"col-red\">高薪诚聘SEO，国内兼职/全职</a></li></ul>";

        html += "<ul class=\"ToolslistW\">";
        html += "<li><a href=\"http://www.xlcidc.com\" target=\"_blank\" class=\"col-red\">【超级防御服务器】★打不死高防</a></li>";
        html += "<li><a href=\"http://www.nlidc.cn/server.html?pg=22\" target=\"_blank\" class=\"col-blue\">香港高端服务器/先试用/后付款</a></li>";
        html += "<li><a href=\"http://www.55dx.com/server.html\" target=\"_blank\" class=\"col-red\">香港稳定服务器/买一送一</a></li>";
        html += "<li><a href=\"http://www.mai31.com\" target=\"_blank\" class=\"col-blue\">收流量质量好可1万IP五千元收</a></li></ul>";

        html += "</div>";
        return html;
    },
    centerImg: function () {//中间图片
        var html = '<div class="ToolsImgWrap clearfix"> ';
        html += '<div class="fl mr10 ToolsFive"><a href="https://www.simcentric.com/sc/promos/2018-belt-road" target="_blank"><img src="http://stats.chinaz.com/gj_g/si.gif"></a></div>';
        html += '<div class="fl mr10 ToolsFour"><a href="https://hongtu777.com/" target="_blank"><img src="http://stats.chinaz.com/gj_g/hongtu777.gif"></a></div>';
        html += '<div class="fl ToolsFive"><a href="http://wpa.qq.com/msgrd?v=3&uin=7003288&site=qq&menu=yes" target="_blank"><img src="http://stats.chinaz.com/gj_g/7003288.gif"></a></div></div>';
        return html;
    },
    toolsIntro: '<a class="col-red pr15" target="_blank" href="http://www.qqll.me/">10000来路IP只需8元</a><a class="col-blue" target="_blank" href="http://www.xfisp.com">香港云服务器低至28元/月</a>',
	t_mapbar:'',//首页

    pingImg: '<a href="http://www.666idc.com" target="_blank"><img src="http://stats.chinaz.com/gj_g/666idc.gif"></a><a href="http://www.yisu.com/ddos/huodong" target="_blank"><img src="http://stats.chinaz.com/gj_g/qy551.gif"></a><a href="http://www.accallcenter.com/" target="_blank"><img src="http://stats.chinaz.com/gj_g/accallcenter.gif"></a>', //Ping图片
    speedImg: '<a href="http://www.666idc.com" target="_blank"><img src="http://stats.chinaz.com/gj_g/666idc.gif"></a><a href="http://www.yisu.com/ddos/huodong" target="_blank"><img src="http://stats.chinaz.com/gj_g/qy551.gif"></a><a href="http://www.accallcenter.com/" target="_blank"><img src="http://stats.chinaz.com/gj_g/accallcenter.gif"></a>', //国内测速
    bottomImg: '<a href="http://www.kk30.com?dibu" target="_blank"><img src="http://stats.chinaz.com/gj_g/kk1200.gif"></a>', //底部图片

    init: function () {
        jQuery('#topImg').html(this.topImg);
        jQuery('#topTxt').html(this.topTxt());
        jQuery('#navAfter').html(this.navAfter());
        jQuery('#centerTxt').html(this.centerTxt());
        jQuery('#centerImg').html(this.centerImg());
        jQuery('#toolsIntro').html(this.toolsIntro);
        jQuery("#t_mapbar").append(this.t_mapbar);
        jQuery('#pingImg').html(this.pingImg);
        jQuery('#speedImg').html(this.speedImg);
        jQuery('#bottomImg').html(this.bottomImg);
    }
}
tool_a.init();
//当前位置
var loc_a = {
    type1: '<a href="https://www.kkidc.com/index.php/activity/yz_bgp" target=_blank><font color=red>10月活动：1元买走扬州多线BGP</font></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="https://www.kkidc.com/zuyong/dianxin/xiamen/" target="_blank">快快厦门三线高防仅售899元！</a>',
    type3: '<a href="http://www.ciku5.com" target="_blank" title="流量利器词库网"><font color=red>流量利器词库网</font></a><a href="http://tool.chinaz.com/kwevaluate/"><font color=red>关键词优化分析</font></a>',
    type4: '<a href="http://tool.chinaz.com/speedtest.aspx" target="_blank"><font color=red>网站测速</font></a><a href="http://tool.chinaz.com/kwevaluate"><font color=red>关键词优化难易分析</font></a>',
    init: function () {
        var loc = $("#loc");
        var tNum = $("#tnum").attr("n");
        if (!loc) return;
        switch (tNum) {
            case "1":
                loc.html(this.type1);
                break;
            case "3":
                loc.html(this.type3);
                break;
            case "4":
                loc.html(this.type4);
                break;
            default:
                loc.html(this.type1);
                break;
        }
    }
}
loc_a.init();
---------------------------------------------------------------------------------------------------
为您推荐
	同类型推荐
	关联推荐
	协同推荐

资讯推荐在30,31服务器上
30 nignx负载到了30,31两台服务器，调用apache httpd服务
程序目录 /data/home/work/targetV3/recom_online_webapp/news
apache程序目录 /data/home/work/local/apache
apache日志路径 /data/home/work/local/apache/logs/online
nignx部署在30的 /data/home/work/local/nginx-1.12.1
---------------------------------------------------------------------------------------------------
停止MySQL
1添加删除程序中卸载MySQL
2到安装目录删除MySQL
3删除：C:\Documents and Settings\All Users\Application Data\MySQL
	C:\ProgramData\MySQL
4查看注册表：
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services
HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services
HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Services
搜索mysql，找到一律干掉！
============================

不需要重启电脑(win xp)，直接重新安装即可
---------------------------------------------------------------------------------------------------
dim d as object
Set d = Created("Scripting.Dictionary")
Add方法，添加关键字项目对：d.add "key", "item"
Exists方法，d.Exists("key")返回true或false
Keys方法，arr=d.Keys，返回一个数组，其中包含了一个Dictionary对象中的全部现有的关键字
Items方法，brr=d.Items，返回一个数组，其中包含了一个Dictionary对象中的所有项目
Remove方法，d.Remove("key")，从一个Dictionary对象中清除一个关键字项目对
RemoveAll方法，d.RemoveAll，从一个Dictionary对象中清除所有关键字项目对
d.Count，返回一个Dictionary对象中的项目数，只读属性
d.Key("key1") = "key2"，用key2替换原Dictionary对象中的key1
d.Item("key") = newItem，在一个Dictionary对象中设置或者返回所指定key的item
d.CompareMode = 1(设置字典的比较模式是文本，该比较模式下不区分关键字大小写)，如果提供了此项，可以使用的值是0(二进制)，1(文本)，2(数据库)
---------------------------------------------------------------------------------------------------
Project
	|---src(源码包)
		|---main(正常的源码包)
			|---java(.java文件的目录)
			|---resources(资源文件的目录)
		|---test(测试的源码包)
			|---java
			|---resources
	|---target(class文件,报告等信息存储的地方)
	|---pom.xml(maven工程的描述文件)


使用：在类上添加注解，如下：
   @Getter 和 @Setter: 为你的字段创建getter和setter
   @EqualsAndHashCode: 实现equals()和hashCode()
   @ToString: 实现toString()
   @Data: 使用上面四个注解的特征
   @Cleanup: 关闭流
   @Synchronized: 对象上同步
   @SneakyThrows: 抛出异常
   @NoArgsConstructor：注解在类上；为类提供一个无参的构造方法
   @AllArgsConstructor：注解在类上；为类提供一个全参的构造方法
   @Data   ：注解在类上；提供类所有属性的 getting 和 setting 方法，此外还提供了equals、canEqual、hashCode、toString 方法
   @Setter：可用在类或属性上；为属性提供 setting 方法
   @Getter：可用在类或属性上；为属性提供 getting 方法
---------------------------------------------------------------------------------------------------
-- 学生表
create table student(
	stuid varchar(10)primary key,
	stuname varchar(50)
)

-- 分数表
create table score(
	stuid varchar(10),
	score int,
	courseid int,
	constraint fk_stu_sco  foreign key(stuid) references student(stuid)
)

drop table score;

select * from student;
insert into student values('1001','张三峰');
insert into student values('1002','张无忌');
insert into student values('1003','王尼玛');
insert into student values('1004','王老五');

select * from score;
insert into score values('1001',98,1);
insert into score values('1002',95,1);
insert into score values('1002',67,2);
insert into score values('1003',83,2);
insert into score values('1003',57,3);

select * from student s,score c where s.stuid=c.stuid;

select * from student s left join score c on s.stuid=c.stuid;


--------------联合查询------------------
create table a(
	name varchar(10),
	score int
)

create table b(
	name varchar(10),
	score int
)

insert into a values('a',10),('b',20),('c',30);
insert into b values('a',10),('b',20),('d',40);
---------------------------------------------------------------------------------------------------
# train_word2vec_model.py
import logging
import os.path
import sys
import multiprocessing
from gensim.models import Word2Vec
from gensim.models.word2vec import LineSentence

program = os.path.basename(sys.argv[0])  # os.path.basename表示返回path最后的文件名；sys.argv[0]表示传递命令行参数，参数train_word2vec_model.py为argv[0]
logger = logging.getLogger(program)        # 不是文件名，而是日志记录的用例名:getLogger(__name__ = 'root')
logging.basicConfig(format='%(asctime)s: %(levelname)s: %(message)s')
logging.root.setLevel(level=logging.INFO)
logging.info("running %s" % ' '.join(sys.argv))  # info表示打印，Python join() 方法用于将序列中的元素以指定的字符连接生成一个新的字符串。
if len(sys.argv) < 4:
	print(globals()['__doc__'] % locals())  # 全局变量，局部变量
	sys.exit(1)
inp, outp, outp2 = sys.argv[1:4]  # 依次表示切割后的文本，模型，向量
model = Word2Vec(LineSentence(inp), size=400, window=5, min_count=5, workers=multiprocessing.cpu_count())  #.window是句子中当前词与目标词之间的最大距离
model.save(outp)  # 训练后的模型保存；# 以二进制格式存储
model.wv.save_word2vec_format(outp2, binary=False)  # 以文本格式存储, 一行是一个词的vector
---------------------------------------------------------------------------------------------------
def writeFile(input_path, file_name, output_path, columnNum):
    old_file = open(input_path + '/' + file_name, mode='r', encoding='UTF-8')
    num = file_name.split('_')[0]
    new_file = open(output_path + '/' + num + '.html', mode='w', encoding='UTF-8')
    new_file.write('<!DOCTYPE html><html><head><meta charset="UTF-8"><title>' + file_name.split('_')[2].split('.')[0] + '</title></head>' + '\r\n')
    new_file.write('<body>' + '\r\n')
    new_file.write('<table>' + '\r\n')
    str1 = "<td><input type='button' onclick='biaohuang(this)' ondblclick='test(this)' value='"
    str2 = "'/></td>"
    i = 0
    for line in old_file:
        str0 = str1 + line.replace('\n', '').replace('\t', ',') + str2
        if i % columnNum == 0:
            str0 = '<tr>' + '\r\n' + str0 + '\r\n'
            new_file.write(str0)
        elif i % columnNum == columnNum - 1:
            str0 = str0 + '\r\n' + '</tr>' + '\r\n'
            new_file.write(str0)
        else:
            str0 = str0 + '\r\n'
            new_file.write(str0)
        i = i + 1
    if len(old_file.readlines()) % columnNum != 0:
        new_file.write('</tr>' + '\r\n')
    old_file.close()
    new_file.write('</table>' + '\r\n')
    new_file.write("<br><br><br><input type='button' onclick='baocun()' value='保存'/>")
    if num != '30':
        new_file.write("<a href = '" + str(int(num)+1) + ".html'>下一页</a>")
    new_file.write('\r\n' + '</body>' + '\r\n' + '<script src="../js/demo.js"></script>' + '</html>' + '\r\n')
    new_file.close()
import os
for info in os.listdir('input'):
	import re
    if re.match('.*?.txt', info, flags=0):
        writeFile('input', info, 'html', 10)
---------------------------------------------------------------------------------------------------




