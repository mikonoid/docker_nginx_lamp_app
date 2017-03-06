# docker_nginx_lamp_app

Build container

docker build -t nginx/lamp .

Run docker container

docker run -d -p 80:80 -p 3306:3306 nginx/lamp
