FROM django:python3-onbuild
MAINTAINER Vinicius Vasconcelos "vasconcelosvcd@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

COPY taiga-back /usr/src/app/taiga-back
COPY docker-settings.py /usr/src/app/taiga-back/settings/local.py
COPY locale.gen /etc/locale.gen
COPY default.locale /etc/default/locale
COPY requirements.txt /usr/src/app/taiga-back

RUN apt-get update  && apt-get autoremove -y && apt-get install locales -y
RUN locale-gen pt_BR.UTF-8 && dpkg-reconfigure locales

RUN (cd /taiga && python manage.py collectstatic --noinput)

WORKDIR /usr/src/app/taiga-back

RUN pip install -r requirements.txt

EXPOSE 8000

# Volume definition in docker-compose.yml instead of here, soon
VOLUME ["/taiga/static","/taiga/media"]

RUN locale -a

ENTRYPOINT ["python", "manage.py", "runserver", "0.0.0.0:8000"]
