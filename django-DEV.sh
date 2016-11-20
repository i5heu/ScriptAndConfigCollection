#!/bin/sh
read -p "H1 press [1] Dev.Server [2] django admin PW [1337]Install `echo '\n> '`" choice

if [ $choice -eq "1" ]; then
  python manage.py runserver 0.0.0.0:8000
elif [ $choice -eq "2" ]; then
  exec python manage.py createsuperuser
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
