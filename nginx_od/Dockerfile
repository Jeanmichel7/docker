# syntax=docker/dockerfile:1
FROM nginx:1.23.1-alpine
COPY static-html-directory /usr/share/nginx/html

# docker build -t nginx-image .                                     some-content-nginx = name image
# docker run --name nginx -dp 8080:80 nginx-image                   nginx-name = name conteneur




# dans le terminal du conteneur
# apk update
# apk add openssl
RUN apk update && \
    apk add openssl
#    tail -f /dev/null

# creation certificat 
# https://www.linode.com/docs/guides/create-a-self-signed-tls-certificate/
# https://www.linode.com/docs/guides/getting-started-with-nginx-part-3-enable-tls-for-https/

# openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out MyCertificate.crt -keyout MyKey.key





# dans /root/certs




