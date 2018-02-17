<?php
define('sqldb','zzcms');//数据库名
define('sqluser','root');//用户名
define('sqlpwd','');//密码
define('sqlhost','localhost');//连接服务器,本机填(local)，外地填IP地址
define('sqlport','3306');//端口
define('zzcmsver','Powered By <a target=_blank style=font-weight:bold href=http://www.zzcms.net><font color=#FF6600 face=Arial>ZZ</font><font color=#025BAD face=Arial>CMS8.2</font></a>');//版本
define('sitename','zzcms') ;//网站名称
define('siteurl','/') ;//网站地址
define('logourl','/image/logo.png') ;//Logo地址
//define('siteurl','http://centos7') ;//网站地址
//define('logourl','http://centos7/image/logo.png') ;//Logo地址
define('icp','豫icp备07007271号') ;//icp备案号
define('webmasteremail','357856668@qq.com') ;//站长信箱
define('kftel','0371-86137281') ;//联系电话
define('kfmobile','13838064112') ;//手机
define('kfqq','357856668') ;//QQ
define('sitecount','<script language=Javascript src=http://localhost:8080/gcount/graphcount.php></script>') ;//网站统计代码
define('channelzs','招商') ;//招商显示为
define('channeldl','代理') ;//代理显示为
define('opensite','Yes') ;//网站运行状态
define('showwordwhenclose','网站正在维护中……') ;//关闭网站原因
define('openuserreg','Yes') ;//注册用户状态
define('openuserregwhy','网站暂时关闭注册功能，明天开放！') ;//关闭注册用户原因
define('isaddinfo','No') ;//是否允许未审核的用户发布信息
define('pagesize_ht','50');//管理员后台每页显示信息数
define('pagesize_qt','20');//前台每页显示信息数
define('whendlsave','No') ;//当有代理或求购留言是否打开在线发邮件功能
define('whenuserreg','No') ;//当新用户注册时是否打开在线发邮件功能
define('whenmodifypassword','Yes') ;//当用户修改密码时是否开发在线发邮件功能
define('smtpserver','smtp.126.com') ;//邮件服务器
define('sender','ggyyxxcom@126.com') ;//发送邮件的地址
define('smtppwd','') ;//email密码
define('sendsms','No') ;//发手机短信开关
define('smsusername','cmsx') ;//SMS用户名
define('smsuserpass','zxcv1234') ;//SMS密码
define('apikey_mobile_msg','cdac640014f9d05cc1baaf5e7cf35f33') ;//apikey_mobile_msg
define('isshowcontact','No') ;//是否公开代理商联系方式
define('liuyanysnum','0'); //延时时间
define('channel','zh#wangkan#zx#pp#special#job#baojia#ask') ;//功能模块开关
define('usergr_power','dl#wangkan#zx') ;//个人用户权限
define('shuxing_name','') ;//产品更多属性设置
define('wordsincomane','') ;//公司名称中必填行业性关键字
define('lastwordsincomane','') ;//公司名称中必填公司类型性关键字
define('nowordsincomane','a|b|c|d|e|f|g|h|i|g|k|l|m|n|o|p|q|r|s|t|u|v|w|x|w|z|A|B|C|D|E|F|G|H|I|G|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|1|2|3|4|5|6|7|8|9|0') ;//公司名称中禁用关键字
define('stopwords','得普利麻|易瑞沙|益赛普|赫赛汀|日达仙|百泌达|多吉美|拜科奇|赛美维|施多宁|派罗欣|妥塞敏|格列卫|特罗凯|手机窃听器|手枪') ;//网站禁用关键字
define('allowrepeatreg','Yes') ;//是否允许重复注册用户
define('showdlinzs','No') ;//招商信息内是否显示代理留言数
define('zsliststyle','list') ;//招商列表页默认显示格式
define('siteskin','red13') ;//网站电脑端模板
define('siteskin_mobile','') ;//网站手机端模板
define('siteskin_usercenter','1') ;//用户中心样式
define('checksqlin','No') ;//是否开启防SQL注入功能
define('cache_update_time','0') ;//缓存更新周期
define('html_update_time','0') ;//静态页更新周期
define('zsclass_isradio','No') ;//小类别是否设为单选（设为否时为多选）
define('checkistrueemail','No') ;//用户注册时是否开启邮箱验证功能
define('sdomain','No') ;//用户展厅页是否启用二级域名
define('whtml','No') ;//是否开启伪静态
define('isshowad_when_timeend','Yes') ;//到期的广告是否还让显示
define('showadtext','asdf') ;//到期的广告前台显示语
define('qiangad','Yes') ;//是否开通抢占广告位功能
define('showadvdate','15') ;//广告位置占用时间
define('duilianadisopen','No') ;//是否打开对联广告
define('flyadisopen','No') ;//是否打开漂浮广告
define('jifen','Yes') ;//是否启用积分功能
define('jifen_bilu','1') ;//1元等于多少积分
define('jf_reg','50') ;//注册时获取积分值
define('jf_login','20') ;//登录时获取积分值
define('jf_addreginfo','10') ;      //完善注册信息获取积分值
define('jf_lookmessage','50') ;  //查看代理留言时扣除的积分值
define('jf_look_dl','50') ;  //查看代理商信息库时扣除的积分值
define('jf_set_adv','10') ; //抢占首页广告位扣除的积分值
define('jf_set_elite','10') ; //固顶信息扣除的积分值
define('maximgsize','20000') ;  //图片文件大小限制,单位K
define('maxflvsize','20') ;  //视频文件大小限制,单位M
define('shuiyin','No') ;//是否启用水印功能
define('addimgXY','right') ;//水印位置
define('syurl','uploadfiles/2016-11/20161106174625754.png') ;//水印图片地址
define('alipay_partner','2088002168041280') ;//合作者身份ID
define('alipay_key','g6m9go08qiag25d6bvb1uvrtkdpqral7') ;//安全检验码
define('alipay_seller_email','lzy0393@126.com') ;//签约支付宝账号或卖家支付宝帐户
define('tenpay_bargainor_id','1210032601') ;//财富通商户号
define('tenpay_key','5cc08461639a8b7fd5302a194deef7c0') ;//密钥
define('qqlogin','Yes') ;//是否开启QQ登录功能
define('bbs_set','No') ;//是否开启同步论坛功能
?>
