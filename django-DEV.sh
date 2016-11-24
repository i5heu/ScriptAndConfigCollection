#!/bin/sh
#Curent DIR
CurentDir=${PWD##*/}  
DATE=`date +%Y-%m-%d-%H-%M-%S-YMDHMS`


read -p "H1 press [1] Dev.Server [2] django admin PW [3]make BackUp  [1337]Install `echo '\n> '`" choice

if [ $choice -eq "1" ]; then
  python manage.py runserver 0.0.0.0:8000
#############################################################################
elif [ $choice -eq "2" ]; then
  exec python manage.py createsuperuser
#############################################################################
elif [ $choice -eq "3" ]; then
  if [ -d ~/CodeBackup ]; then
    FILENAME="${DATE}-${CurentDir}"
    echo "BackUp saved in:"
    echo ${FILENAME}
    exec tar -zcvf ~/CodeBackup/${FILENAME}.tar.gz ./
  else
    echo "DIR ~/CodeBackup dose not exist - create? 23 for YES >"
    read dirchoice
    if [ $dirchoice -eq "23" ]; then
      exec mkdir ~/CodeBackup
      echo "OK!"
    else
      echo "EXIT!!!!"
      exit
    fi
  fi




###############################################################################
elif [ $choice -eq "1337" ]; then
  read -p "For installing nginx/apache2 on port 84 / mysql-server / phpmyadmin / htop / python-pip python-mysqldb and dajngo ---> enter 42: `echo '\n> '`" choice2
  if [ $choice2 -eq "42" ]; then

    sudo apt-get install nginx-extras apache2
    sudo sed -i -e 's/80/84/g' /etc/apache2/ports.conf
    sudo apt-get install mysql-server
    sudo apt-get install phpmyadmin
    sudo apt-get install htop
    sudo apt-get install python-pip python-mysqldb
    sudo pip install django


  else 
    echo "NOTHING INSTALED"
  fi
else
  echo "Nothing selectet"
fi
