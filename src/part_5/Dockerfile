FROM ubuntu:20.04

# Установка необходимых пакетов и очистка кэша apt
RUN apt-get update && \
    apt-get install -y gcc make spawn-fcgi libfcgi-dev nginx curl && \
    rm -rf /var/lib/apt/lists/*

# Копирование исходников сервера
COPY ./server /home/server

# Копирование конфига nginx
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

# Сборка сервера
RUN cd /home/server && \
    make all

# Смена прав доступа для файлов
RUN chmod 755 \
    /usr/bin/passwd \
    /usr/bin/mount \
    /usr/bin/umount \
    /usr/sbin/unix_chkpwd \
    /usr/bin/gpasswd \
    /usr/sbin/pam_extrausers_chkpwd \
    /usr/bin/chfn \
    /usr/bin/chsh \
    /usr/bin/newgrp \
    /usr/bin/su \
    /usr/bin/chage \
    usr/bin/expiry

# Добавление нового пользователя
RUN useradd -ms /bin/bash collenep \
    && chown -R collenep:collenep /usr/bin \
    && chown -R collenep:collenep /usr/sbin \
    && chown -R collenep:collenep /var \
    && chown -R collenep:collenep /run

# Смена пользователя на nginx
USER collenep

# Запуск сервера и nginx
CMD ["sh", "-c", "spawn-fcgi -p 8080 /home/server/server && nginx -g 'daemon off;'"]

# Проверка
HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost:80 || exit 1

