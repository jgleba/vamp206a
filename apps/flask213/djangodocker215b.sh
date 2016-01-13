#!/usr/bin/env bash
cd
# echo off
set +vx
# echo on
set -vx
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function offline()
{
exit 999
# begin block comment =============================
: <<'END'
comment...
END
# end block comment ===============================
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
date
#
#main...
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
date
#



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Title:  . docker python

-----------------------2016-01-12[Jan-Tue]14-38PM

https://docs.docker.com/compose/django/

mkdir -p /var/www/html/python
cd /var/www/html/python
mkdir docker215b
cd docker215b


dockerfile..

FROM python:2.7
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN pip install -r requirements.txt
ADD . /code/


requirements.txt

Django
psycopg2



docker-compose.yml

db:
  image: postgres
web:
  build: .
  command: python manage.py runserver 0.0.0.0:8000
  volumes:
    - .:/code
  ports:
    - "8000:8000"
  links:
    - db



docker-compose run web django-admin.py startproject composeexample .

sudo chown -R $USER:$USER .

In your project dirctory, edit the composeexample/settings.py



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

