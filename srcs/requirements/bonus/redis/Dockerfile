# syntax=docker/dockerfile:1
FROM debian:buster

RUN apt-get update && apt-get install -y redis-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* \
    && sed -i 's|bind 127.0.0.1|#bind127.0.0.1|g' /etc/redis.conf \
    && sed -i 's|# maxmemory <bytes>|maxmemory 256mb|g' /etc/redis.conf \
    && echo "maxmemory-policy allkeys-lru" >> /etc/redis.conf

EXPOSE 6379

CMD ["redis-server", "/etc/redis/redis.conf"]