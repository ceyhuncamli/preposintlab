#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]
  then echo "Bu scriptiroot yetkisiyle calistiriniz."
  exit
fi

echo "Yeni giris parolaniz..."
passwd

echo "Date ve keyboard TR olarak ayarlaniyor..."
timedatectl set-timezone Asia/Istanbul
setxkbmap -layout tr

echo "Klasorler olusturuluyor..."
mkdir /home/osint/Desktop/case_files
mkdir /home/osint/Desktop/case_report
mkdir /home/osint/Desktop/temp_files

echo "Uygulamalar yukleniyor..."
apt-get update && apt-get upgrade -y 
apt-get install terminator -y
apt-get install exiftool -y
apt-get install nmap -y
apt-get install massscan -y
apt-get install fierce -y
apt-get install zenmap -y
apt-get install amass -y
apt-get install audacity -y
apt-get install vlc -y
apt-get install gimp -y
apt-get install libreoffice -y
apt-get install keepass2 -y
apt-get install gedit -y
apt-get install ffmpeg -y
apt-get install sqlitebrowser -y
apt-get install dnsrecon -y
apt-get install bleachbit -y
apt-get install docker.io -y

systemctl enable docker --now
docker pull mxrch/ghunt

echo "Firefox eklentileri ayarlaniyor..."
wget https://launchpad.net/veracrypt/trunk/1.24-update7/+download/veracrypt-1.24-Update7-Debian-10-amd64.deb
dpkg -i vera*

wget https://addons.mozilla.org/firefox/downloads/file/3353640/link_gopher-2.0.1-fx.xpi
sudo -u osint firefox link_gopher-2.0.1-fx.xpi

wget https://addons.mozilla.org/firefox/downloads/file/788781/shodanio-0.3.2-an+fx.xpi
sudo -u osint firefox shodanio-0.3.2-an+fx.xpi

wget https://addons.mozilla.org/firefox/downloads/file/3657524/wappalyzer-6.3.10-fx.xpi
sudo -u osint firefox wappalyzer-6.3.10-fx.xpi

wget https://addons.mozilla.org/firefox/downloads/file/3590348/hackbar-2.3.1-fx.xpi
sudo -u osint firefox hackbar-2.3.1-fx.xpi

wget https://addons.mozilla.org/firefox/downloads/file/3551985/disable_webrtc-1.0.23-an+fx.xpi
sudo -u osint firefox disable_webrtc-1.0.23-an+fx.xpi

wget https://addons.mozilla.org/firefox/downloads/file/3637661/ip_address_and_domain_information-4.0.6.0-fx.xpi
sudo -u osint firefox  ip_address_and_domain_information-4.0.6.0-fx.xpi

wget https://addons.mozilla.org/firefox/downloads/file/3616824/foxyproxy_standard-7.5.1-an+fx.xpi
sudo -u osint firefox foxyproxy_standard-7.5.1-an+fx.xpi

wget https://addons.mozilla.org/firefox/downloads/file/3641782/search_by_image-3.1.0-an+fx.xpi
sudo -u osint firefox search_by_image-3.1.0-an+fx.xpi

wget https://addons.mozilla.org/firefox/downloads/file/3654840/user_agent_switcher_and_manager-0.4.4-an+fx.xpi
sudo -u osint firefox user_agent_switcher_and_manager-0.4.4-an+fx.xpi

wget https://addons.mozilla.org/firefox/downloads/file/993242/exif_viewer-3.7.5-an+fx.xpi
sudo -u osint firefox exif_viewer-3.7.5-an+fx.xpi

wget https://addons.mozilla.org/firefox/downloads/file/3663762/jsonview-2.2.1-fx.xpi
sudo -u osint firefox jsonview-2.2.1-fx.xpi

wget https://addons.mozilla.org/firefox/downloads/file/3643422/builtwith-2.2-an+fx.xpi
sudo -u osint firefox builtwith-2.2-an+fx.xpi

echo "Temizlik islemleri..."
apt-get autoremove -y
rm  *.xpi
rm  *.deb
echo "Kurulumlar tamamlandi."
