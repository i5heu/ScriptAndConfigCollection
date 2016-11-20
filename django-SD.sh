#!/bin/sh
read -p "H1 press [1] Dev.Server [2] django admin PW\n>" choice

if [ $choice -eq "1" ]; then
  python manage.py runserver 0.0.0.0:8000
elif [ $choice -eq "2" ]; then
  exec python manage.py createsuperuser
else
  echo "Nothing selectet"
fi
