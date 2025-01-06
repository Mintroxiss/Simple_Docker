FROM nginx:latest

# Установка пакетов
RUN apt-get update && \
    apt-get install -y gcc make spawn-fcgi libfcgi-dev nginx

# Копирование исходников сервера
COPY ./server /home/server

# Копирование конфига nginx
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

# Сборка сервера
RUN cd /home/server && \
    make all

# Запуск сервера и nginx
CMD ["sh", "-c", "spawn-fcgi -p 8080 /home/server/server && nginx -g 'daemon off;'"]
