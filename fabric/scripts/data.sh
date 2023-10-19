#!/bin/bash

# this script should run as root

apt-get update && apt-get -y upgrade
apt-get install -y build-essential make zlib1g-dev librrd-dev libpcap-dev autoconf libarchive-dev iperf3 htop bmon vim wget pkg-config git python-dev python3-pip libtool

######################
### EDIT /etc/hosts ##
######################

#cat << EOF >> /etc/hosts
#EOF


############################
### INSTALL APACHE2     ####
############################
apt-get install -y apache2
a2enmod userdir


############################
### INSTALL TSTAT       ####
############################

cd
wget http://www.tstat.polito.it/download/tstat-3.1.1.tar.gz
tar -xzvf tstat-3.1.1.tar.gz
cd tstat-3.1.1
./autogen.sh
./configure --enable-libtstat --enable-zlib
make && make install

############################
### SETUP POSEIDON USER ####
############################
cd
useradd -s /bin/bash -d /home/poseidon -m poseidon

echo "poseidon     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

mkdir /home/poseidon/.ssh
chmod -R 700 /home/poseidon/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDMnR9XlDv/NiEyKPgMzO/WOcQ9ZoDt2BYC7CHB9EmJQG4dwtzhioLJspJ8t4IuHpw6JlxjybTYqVUJqbKKT56t7PdFrzy7R5D5MO31CcAMhzaaFL7mtviIj+jy4wEitZr5Jh7SGgPFTLA54cx3fHCsrs0I0PjSRcaKtEi0RK0HsmUNrh5cRFm1oOgShkthM9KMfZAJ2hhkaoneywGfBvfq3dOQkfFdTCxn3B+Sc28l6wtT+n9ruNhasQ3OqmkZ5lhg+/CH5zTd7dCy57Fd/BuFEUq3pdhLIXXhnxDTftn1Nwd6FLy865XlIMnSSt8ds/X3sndupkA7G5f6ZyDKZinJRjr+pGrKC5lly1L3sw/oPguQDfHJ7VJI/jVWP4A4Xp0etXw50pF0GgA9+UT84tBfe3LB4cMhdJ/UWrEgK/jjCtSIe9bahT4gCL2PIbIacOXFqla3DiEcw/ZcCr8hprFLey04BgDvbMN1x+AydXvLjl4eDar5/ey1AlLzaNLXobEdK17DMsG6I3spJFJ/MB18vEu+F4QpTh9A4btX81XFWssdXhynVrrSbMgepQQAYoa92VVAD/re9PgwMXDHaERJW190SyV+ruv0R9FEmp9izWN44tx8E6hyo/eHZ7H65DlBilRQBehsefN7dY0BApLAxmpRkuwa0c1XE0UkEkZQOw== georgpap@iris.isi.edu" > /home/poseidon/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDmj6OLvGDh7yTfTkiKsdcPCup9l1yb4y6QN1aiIguNkQTvthoWatBiPBnyu/Rlvz6/ivn3fx0/Ig5FVEDp6WwWZjBI+XBZYP6RsKXwwLc+NCG0NbOKA1kA5SkybMItW0qPnKX2ReJpLxr3HL/xlfgdH3b/vzwypg6vAiPzRBuwOv4kRHciP1mUSNt78cEFOE9DOPZ9ZtlIKRH6HSsOMSqAkKP86luY5vdW1VH6j6Ynce8Qr5+/15XBqxgzh9a5z+KIEnXXGwUvuzxCskvwdDdF31Ac9QroCDGaQBJ0/wvP+1DlpXqUeQ/n4a1HTXAXQdsH9FE9Z8RBfA8jDdpBtJIV congwang@dhcp152-54-9-203.europa.renci.org" >> /home/poseidon/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDKBlHM4+PEA4IvEw7BtDIO8QMmQUNyyOFTGM5NZXwxWygkL1SArrQe++0UWbTfv3+z2X8yPpEzIG/KtVX7590DaaGBZDTpgUa4Rl1w8aDtS4sp15PJsiCsOUbHLgXNmKwptO02+XlGLWBBQJfMdt/8g4l4QuqeJyOY1Aa6o/lVe6D1iTQ7t371Fh8oBBkDP/qjBaUd50Mi2An6RF36rNLAYgHs9qSU14PFJpFe7GoTFSznKc8wxoMKjz+JC88dbIMjj9uZ3lPpWMP3sOQ7aj/9BJbtft58n1T0OUuIrRRxQD894AMdrTwRcIDm/QLfZD/EmRohfQdR4MpPOvGEkANBPexXpM2t1rH19s/28nIsYXaKNUhHDhRsL3zHSwwU6e1s1ru0q0QyvfawC0UNcrXgE7I7JnUqdMzGnLT+Pqs/Hp12qpLQroTHjS0p1shPb1xTdDbQmedxP1+2JGNjSZq7CHyeS3McXQRe84dzvuYa57SQsdB+CGy6FtaoCYQxQCgzbUxCE7//gpo4UUhjTYpzvWl5h/mHve7CVKHTwb9EmVXK5HMYBwa+hHcTEV8tIqzUmT16Omt2SuKF+x7vvH6Qh6jz92h0W8Uq8iFZDF+KaXTIlZ/Yc1MyGWnRhM94Lga19t3s3FWMEOhXUyCM2wX1KGRSx3JwlmUhhWISPHhrOQ== poseidon@poseidon-submit" >> /home/poseidon/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDZiIIRlgxDk/MFEKI/x208b7ipdIzIBef4rXELOoiNO17vgEridYWddyeaP5wSH+jCSE2gHrdJOSxqCY60GW9QADs4ObUUEU+31dZhpf/OYF5/eMzTVoRMxUF5fdxAP1B2MtfIVatrPSkYmrX4rNKOnevUhxEuAIuTA6oHa/TT8UHm+RJl9G1CJGcHzYbMRElJh4BouD9c2nguv7L3ymj0izqFDPbFoSGg8LlNJ2Kiesr7jOllFp5fzLzsU90/2fiSGl0MKzpGst4GH0Dx36GPJcN4t1VCirVsjb/m1Iw4PWOZ29us5+N8nW9r16rpaqUsS432k+BAF4jN1wMqiC6ciGG19Igu45mmHa0LnMhdmsSCBuG9iN4k81AIeLR84KM8wDf9OqgiakSf/3zmuaD9TeCJq52pgdY2oR6TADsdqJBzFtdYduh12ddqxTbAt2HZw67RTbNztiEQMbx4Desf6Of9USxzuX8NM+oNOHhK24iy+5ZucmO8e8Gtk8VJcm5sPSaZYtYrF9IOJrbHRWGUjAzRiI6qRei/BeHuxsJqtdRC4HocSiCz+DdVs+GeMFtz9Q0Jz7VZooFDZyaQngroCc6YdIwLN8p+JUGdSXoptz+EqQ+PfB7OiJ1jpH+VMR2oM4t0hmvzH8wlkxCzvFVyjK5pNhPmCjzl5pzIxkyHTw== aparnanaik@D23ML-ANAIK.local" >> /home/poseidon/.ssh/authorized_keys


chmod 600 /home/poseidon/.ssh/authorized_keys
chown -R poseidon:poseidon /home/poseidon/.ssh


#### Add http userdir for user poseidon #####
mkdir /home/poseidon/public_html
chmod -R 755 /home/poseidon/public_html
chown -R poseidon:poseidon /home/poseidon/public_html
sed -i 's/.*UserDir disabled.*/\tUserDir disabled root\n\tUserDir enabled poseidon/g' /etc/apache2/mods-available/userdir.conf

#### Restrict access to port 80 and 443 ####
ufw delete allow 80/tcp
ufw delete allow 443/tcp

systemctl restart apache2
