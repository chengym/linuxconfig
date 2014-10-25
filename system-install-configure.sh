#!/bin/bash

#该脚本主要用于ubuntu、linuxmint等系统安装后的配置

echo "第一步：换163源"
sudo mkdir /home/原始源backup/
sudo cp -R /etc/apt/sources.list /home/原始源backup/
sudo echo > /etc/apt/sources.list
sudo echo "deb http://mirrors.163.com/ubuntu/ precise main restricted
deb-src http://mirrors.163.com/ubuntu/ precise main restricted
deb http://mirrors.163.com/ubuntu/ precise-updates main restricted
deb-src http://mirrors.163.com/ubuntu/ precise-updates main restricted
deb http://mirrors.163.com/ubuntu/ precise universe
deb-src http://mirrors.163.com/ubuntu/ precise universe
deb http://mirrors.163.com/ubuntu/ precise-updates universe
deb-src http://mirrors.163.com/ubuntu/ precise-updates universe
deb http://mirrors.163.com/ubuntu/ precise multiverse
deb-src http://mirrors.163.com/ubuntu/ precise multiverse
deb http://mirrors.163.com/ubuntu/ precise-updates multiverse
deb-src http://mirrors.163.com/ubuntu/ precise-updates multiverse
deb http://mirrors.163.com/ubuntu/ precise-backports main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ precise-backports main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ precise-security main restricted
deb-src http://mirrors.163.com/ubuntu/ precise-security main restricted
deb http://mirrors.163.com/ubuntu/ precise-security universe
deb-src http://mirrors.163.com/ubuntu/ precise-security universe
deb http://mirrors.163.com/ubuntu/ precise-security multiverse
deb-src http://mirrors.163.com/ubuntu/ precise-security multiverse
deb http://extras.ubuntu.com/ubuntu precise main
deb-src http://extras.ubuntu.com/ubuntu precise main" >> /etc/apt/sources.list
sudo apt-get update

echo "换源和源更新完毕"

echo "第二步：解决gedit乱码"
gsettings set org.gnome.gedit.preferences.encodings auto-detected "['UTF-8','GB18030','GB2312','GBK','BIG5','CURRENT','UTF-16']"

echo "乱码解决完毕"

echo "第三步：系统图标全部显示"
gconftool --type boolean -s /desktop/ibus/panel/show_icon_on_systray true
gconftool --type boolean -s /desktop/ibus/panel/show true
gsettings set com.canonical.Unity.Panel systray-whitelist "['all']"

echo "系统图标已全部显示"

echo "第四步：解决浏览器字体发虚"
#dir define
myfonts_dir=/usr/share/fonts/truetype/myfonts
remote_dir=http://files.cnblogs.com/DengYangjun

#fonts define
monaco=monaco-linux.ttf
lucida=lucida-console.ttf
msyh=msyh.ttf
msyhbd=msyhbd.ttf
agencyr=agencyr.ttf
agencyrb=agencyrb.ttf

screen=0

sudo mkdir $myfonts_dir 2>/dev/null

echo "Ubuntu字体自动安装工具"
echo "(C)2008-2009 Deng.Yangjun@Gmail.com"

echo "安装等宽英文台字体:Monaco"
wget -O $monaco.zip $remote_dir/$monaco.zip
unzip -o $monaco.zip 1>/dev/null
sudo mv $monaco $myfonts_dir
rm $monaco.zip

echo "安装等宽英文字体:Lucida Console"
wget -O $lucida.zip $remote_dir/$lucida.zip
unzip -o $lucida.zip 1>/dev/null
sudo mv $lucida $myfonts_dir
rm $lucida.zip

echo "安装英文字体:Agency FB"
wget -O $agencyr.zip $remote_dir/$agencyr.zip
unzip -o $agencyr.zip 1>/dev/null
sudo mv $agencyr $myfonts_dir
rm $agencyr.zip

wget -O $agencyrb.zip $remote_dir/$agencyrb.zip
unzip -o $agencyrb.zip 1>/dev/null
sudo mv $agencyrb $myfonts_dir
rm $agencyrb.zip

echo "安装字体:微软雅黑"
wget -O $msyh.zip $remote_dir/$msyh.zip
unzip -o $msyh.zip 1>/dev/null
sudo mv $msyh $myfonts_dir
rm $msyh.zip

wget -O $msyhbd.zip $remote_dir/$msyhbd.zip
unzip -o $msyhbd.zip 1>/dev/null
sudo mv $msyhbd $myfonts_dir
rm $msyhbd.zip

#Ubuntu 7.10
#wget http://www.cnblogs.com/Files/DengYangjun/language-selector.conf.zip
#unzip -o language-selector.conf.zip
#sudo mv language-selector.conf /etc/fonts
#rm language-selector.conf.zip

#Ubuntu 8.04 
echo "请选择显示器类型(1-2)：1-LED	2-CRT"
read screen
case $screen in
1) 
	wget -O local.conf.zip  $remote_dir/local.conf.led.zip
	;;
2)	
	wget -O local.conf.zip  $remote_dir/local.conf.crt.zip
	;;
?) 
	echo "无效选择，退出安装，安装未完成。"
	exit 1;
esac

unzip -o local.conf.zip 1>/dev/null
sudo mv /etc/fonts/conf.avail/51-local.conf /etc/fonts/conf.avail/51-local.conf.old
sudo mv local.conf /etc/fonts/conf.avail/51-local.conf
rm local.conf.zip

cd /etc/fonts/conf.avail
sudo mv 69-language-selector-zh-cn.conf 69-language-selector-zh-cn.conf.old 2>/dev/null

echo "请稍等，正在刷新系统字体..."
cd $myfonts_dir
sudo chmod 555 *
sudo mkfontscale 1>/dev/null
sudo mkfontdir 1>/dev/null
sudo fc-cache -v 1>/dev/null

echo "字体安装完毕，发虚问题已经改善，重启浏览器即可查看效果"

echo "第五步：删除系统自带的不需要的软件"
echo "删除thunderbird雷鸟"
sudo apt-get purge thunderbird
echo "删除音乐播放器thythmbox和电影播放器totem"
sudo apt-get purge thythmbox
sudo apt-get purge totem
echo "删除互联网通信empathy和互联网即使通讯pidgin"
sudo apt-get purge empathy
sudo apt-get purge pidgin
echo "删除多媒体VLC"
sudo apt-get purge VLC

echo "多余软件删除已完成"

echo "第六步：安装系统必备优秀软件"
echo "安装ubuntu tweak"
sudo apt-get install ubuntu-tweak
echo "安装音乐播放器audacious以及视频播放器GNOME MPlayer"
sudo apt-get install audacious
sudo apt-get install gnome-mplayer
echo "安装歌词显示软件OSD lyrics"
sudo apt-get install osdlyrics
echo "安装星际译王"
sudo apt-get install stardict
echo "安装飞信"
sudo apt-get install openfetion
echo "安装java编程环境"
sudo apt-get install openjdk-6-jre
echo "安装vim文本编辑器"
sudo apt-get install vim-gtk

echo "重要必备软件已安装完成"

echo "第七步：升级系统"
sudo apt-get upgrade
sudo apt-get autormove
sudo apt-get autoclean

echo "系统升级完成,五分钟后系统将自动关闭"
sudo shutdown -h +5

#脚本制作：西贤，时间：2012/08/14
