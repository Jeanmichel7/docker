# syntax=docker/dockerfile:1
FROM alpine:3.15.6

RUN apk update &&\
    apk add nginx &&\
    apk add vim &&\
    apk add openssl 
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=RU/ST=Mulhouse/L=Mulhouse/O=JMRCompanie/OU=JMR/CN=https:\/\/github.com\/Jeanmichel7/emailAddress=jrasser@student.42mulhouse.fr"


#COPY static-html-directory /usr/share/nginx/html
COPY ./conf/nginx.conf etc/nginx/nginx.conf
COPY ./conf/default.conf etc/nginx/http.d/default.conf


CMD ["nginx", "-g", "daemon off;"]



# docker build -t nginx-image .                                     some-content-nginx = name image
# docker run --name nginx -dp 8080:80 nginx-image                   nginx-name = name conteneur





#####################   THAT WORK   ##########################
# syntax=docker/dockerfile:1
#FROM alpine:3.15.6
#RUN apk update &&\
#    apk add nginx
#COPY static-html-directory /usr/share/nginx/html
#CMD ["nginx", "-g", "daemon off;"]





##################################################################
#FROM nginx:1.23.1-alpine
#COPY static-html-directory /usr/share/nginx/html

# docker build -t nginx-image .                                     some-content-nginx = name image
# docker run --name nginx -dp 8080:80 nginx-image                   nginx-name = name conteneur




# dans le terminal du conteneur
# apk update
# apk add openssl
#RUN apk update && \
#    apk add openssl
#    tail -f /dev/null

# creation certificat 
# https://www.linode.com/docs/guides/create-a-self-signed-tls-certificate/
# https://www.linode.com/docs/guides/getting-started-with-nginx-part-3-enable-tls-for-https/

# openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out MyCertificate.crt -keyout MyKey.key





# dans /root/certs